## Building a Simple Crypto Alert Bot in Python

Considering the volatility of the cryptocurrency markets, can a crypto enthusiast be smart about when to buy, in pursuit of a “bargain”, and do so in a systematic, automated fashion? This post outlines the process of building a crypto alert system using Python, which sends a push notification via Slack when a cryptocurrency (BTC, XRP, ETCh) appears “cheap” relative to historical prices. 
 
Tags: Python, API, cryptocurrency, bot
 
## Measuring Commute Times with IFTTT and R  

As a recent transplant to New York City, I do my fair share about complaining about the daily commute in and out of the city, which consumes at least an hour of time each way. Looking to add some quantitative weight to my whining, I automatically logged when I left home and work each day using IFTTT and Google Sheets. After collecting 2 months of data, I visualized the distribution of commute times to and from work. 
 
Tags: R, IFTTT, visualization, NYC
 
## Lessons from the Tank: Analyzing 800+ Shark Tank Pitches
 
Even though it’s been around for years, I just recently discovered Shark Tank. I usually wonder if there’s a method to the deal-making madness, especially when a pitch that resonates with me falls flat on the sharks. In this post I explore what kind of pitches have the highest changed of being offered a deal. 
 
Tags: R, NLP, API, web scraping
 
## Jamie Dimon’s Shareholder Letters: A Text Analysis in R

With the recent release of Warren Buffet’s much anticipated annual shareholder letter, I decided to show J.P. Morgan Chase chief Jamie Dimon some love by performing a text analysis on a sample of his annual shareholder letters. In this post I’ll analyze Jamie’s thoughts on the firm, the economy, and politics using tidytext principles, including sentiment, term frequency-inverse document frequency, and bigram network visualization.

Tags: R, NLP, visualization
 
## Choosing the Right Hospital: Exploratory Analysis in R
 
With our baby’s due date quickly approaching, my wife and I needed to find a hospital for delivery. Hoping to contribute something meaningful to the decision, I found data published by the state of New York with hospital-level labor and delivery metrics. By visualizing measures like the percentage of cesarean delivers, I narrowed the list of hospitals without our county to choose from. I guess data-driven decision making can help new data navigate parenthood too? 
 
Tags: R, visualization

## Visualizing NYC Housing Trends with gganimate in R 

The NYC housing market is wild. Where else in the US can you pay so much and get so little in return? In this post I’ll use the gganimate package in R to visualize the ebb and flow of rental housing availability in NYC, using publicly avaiblie data from StreetEasy, "NYC’s leading real estate marketplace". If the law of supply and demand holds, this should inform ideal times for apartment hunting.
 
Tags: R, Visualization, gganimate, NYC

## Mapping Scarsdale Real Estate Data with Python

This year my wife and I moved to New York for the start of a new job. Initially overwhelmed by the scope and pace of the NYC housing market, we were given the very generous and unexpected opportunity by a family friend to live in a house north of the city in Westchester County. Built in the early 1930s, the historic home is situated in central Scarsdale, an affluent suburban town known for high-achieving schools and extravagant real estate. Using Python, the Google Maps geocoding API, and rich property data made avalible by the Village of Scarsdale, this post contains visualizaions of real estate metrics like year built, assessed value, and sales date.

Tags: Python, API, geocoding, visualization

## Scraping Stack Overflow Salaries with Python

The Stack Overflow salary calculator takes inputs like role, location, and education and outputs salary predictions at the 25th, 50th, and 75th percentile. To extract Data Scientist salary data (or extrapolated data) from the tool, I wrote a Python script using Selenium to loop through 350+ different combinations of location, education and expereince.

Tags: Python, Selenium, web scraping

## Visualizing Pocket Articles with R

Every day I see dozens of things online I don’t have time to read or view in the moment. With Pocket I save news articles, blog posts, talks, or tutorials for later viewing. Over the last 2 years I’ve saved just shy of 2,000 links, encompassing a variety of content. n this post I extract insights from these links in R, using link domain and topic frequency to assess my interests.

Tags: R, text mining, visualization

## Extracting Public Transactions from Venmo API with R

Public by default, your Venmo transactions are surprisingly accessible to anyone with an internet connection. It’s public API provides a real-time snapshot view of transactions processed through the system, including usernames and payment subjects. In this post, I how to pull data from the API in an effort to expose the kind of information being openly shared.

Tags: R, API

## Visualizing Baby Name Popularity Trends with R

From the earliest days of our marriage, my wife and I talked about baby names. Your name is a core part of your identity, so choosing the right name for your child feels like a weighty affair. Like always, I turned to data to assist with the decision process. Using a dataset provided by the Social Security Administration, I created functions with R to visualize and compare the popularity of names over time.

Tags: R, functions, visualization

## Web Photo Archiving with R

My wife and two of her sisters ran cross-country and track in high school. I recently learned that their team website, which hosts thousands of event photos from the past 10 years, is being shut down. Wanting to save my mother-in-law from the unimaginably tedious task of manually downloading each image, I wrote a script in R to automate the process. 

Tags: R, web scraping, automation

## Using the Google Maps API to Visualize Chase’s Presence in Utah

In this post, I use Python to create a Chase branch coverage map for my home state of Utah, scrapping branch and ATM information from Chase.com and obtaining geographic coordinates using the Google Maps geocoding API.

Tags: Python, API, web scraping, geocoding
