# webscraping-lol-go-flutter

<p align="center">
  <img src="https://user-images.githubusercontent.com/87580996/216095974-ddc4f9b4-ce40-4a6e-a375-166cfefe5796.png" alt="screenshot" style="height:400px;"/>
</p>

## About

This project consists of a Go API that uses web scraping to retrieve all champions of the game League of Legends from the site mobalitycs and a Flutter application that makes a request to this API to retrieve this data and display it to the user.

The API is built using the "goquery" web scraping library and returns champion data in JSON format.

The Flutter application makes use of the "http" library to make a request to the API and displays the champion data in a list on the app's home screen. 

## How to run

```
- Clone this repository:
$ git clone https://github.com/joasnog/lol-champions-app

- Enter in directory:
$ cd lol_champions_app\api

- Run the server
$ go run main.go

- Change the IP_ADDRESS environment variable located in flutter/.env to your localhost ip.
IP_ADDRESS = YOUR_IP_ADDRESS

- Enter in directory:
$ cd flutter

- Install dependencies
$ flutter pub get

- Run the app: 
$ flutter run
```
