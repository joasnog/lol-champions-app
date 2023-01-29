package main

import (
	"fmt"
	"net/http"

	"github.com/PuerkitoBio/goquery"

	"github.com/gin-gonic/gin"
)

type Champion struct {
	Id          int
	Name        string
	Description string
	ImageUrl    string
}

var data []Champion

func main() {
	lolScrape()

	r := gin.Default()

	r.SetTrustedProxies(nil)

	r.GET("/", func(c *gin.Context) {
		fmt.Printf("ClientIP: %s\n", c.ClientIP())
	})

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.GET("/champions", func(c *gin.Context) {
		c.JSON(http.StatusOK, data)
	})

	r.Run() // listen and serve on localhost:8080
}

func lolScrape() {
	resp, respErr := http.Get("https://app.mobalytics.gg/pt_br/lol/champions")

	if respErr != nil {
		fmt.Println(respErr.Error())
	}

	defer resp.Body.Close()

	if resp.StatusCode != 200 {
		fmt.Println("Error: status code ", resp.StatusCode)
		return
	}

	doc, err := goquery.NewDocumentFromReader(resp.Body)

	if err != nil {
		fmt.Println(err)
	}

	doc.Find(".m-1u0kasc a").Each(func(i int, s *goquery.Selection) {
		championName := s.Find(".m-123baga").Text()
		championDescription := s.Find(".m-am8tfa").Text()
		championImageUrl, exists := s.Find(".m-0").Attr("src")

		if !exists {
			championImageUrl = ""
		}

		data = append(
			data,
			Champion{
				Id:          i + 1,
				Name:        championName,
				Description: championDescription,
				ImageUrl:    championImageUrl,
			},
		)
	})

}
