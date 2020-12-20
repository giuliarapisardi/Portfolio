CS544Final\_Rapisardi
================
Giulia Rapisardi
12/17/2020

## Spotify Top 50 2019

**Objective**

To gather information on songs that are popular and see if there are any
trends or common aspects of the songs that make them likeable, and
therefore put them on the top 50 charts. We also will be looking at
several statistics to see if any genres have similar traits.

### 1.Data Preparation

#### 1.1 Importing Data

The data set contains the top 50 most listened songs in the world by
Spotify. I found the data set on Kaggle and it can be downloaded
at:

``` 
                           (https://www.kaggle.com/leonardopena/top50spotify2019)
                  
```

I used this URL to read the data into
R.

``` r
spotify <- read.csv('~/Desktop/BU/CS 544/Final Project/SpotifyTop50.csv', header = TRUE)
head(spotify)
```

    ##   X                        Track.Name   Artist.Name     Genre Beats.Per.Minute
    ## 1 1                          Señorita  Shawn Mendes       Pop              117
    ## 2 2                             China      Anuel AA Reggaeton              105
    ## 3 3     boyfriend (with Social House) Ariana Grande       Pop              190
    ## 4 4   Beautiful People (feat. Khalid)    Ed Sheeran       Pop               93
    ## 5 5       Goodbyes (Feat. Young Thug)   Post Malone       Rap              150
    ## 6 6 I Don't Care (with Justin Bieber)    Ed Sheeran       Pop              102
    ##   Energy Danceability Loudness..dB.. Liveness Valence. Length. Acousticness..
    ## 1     55           76             -6        8       75     191              4
    ## 2     81           79             -4        8       61     302              8
    ## 3     80           40             -4       16       70     186             12
    ## 4     65           64             -8        8       55     198             12
    ## 5     65           58             -4       11       18     175             45
    ## 6     68           80             -5        9       84     220              9
    ##   Speechiness. Popularity
    ## 1            3         79
    ## 2            9         92
    ## 3           46         85
    ## 4           19         86
    ## 5            7         94
    ## 6            4         84

The data has 14 variables, all giving details about the song and artist.
Three of them are categorical and the remaining 11 are numerical. Most
variables both categorical and numerical will be used while performing
analysis.

#### 1.2 Pre-Processing the Data

The data set was very specific to the artists and with the variables
being majority numerical I wanted to group them into subgroups to make
analysis easier. The first column I addressed was the Genre column.
There were many sub genres that we could categorize into one genre such
as converting Australian Pop to Pop and Country Rap to Rap, and so
forth.

Second, I renamed the ‘X’ column as rank, to put the rows in order from
most to least
    popular.

    ##  [1] "Rank"             "Track.Name"       "Artist.Name"      "Genre"           
    ##  [5] "Beats.Per.Minute" "Energy"           "Danceability"     "Loudness..dB.."  
    ##  [9] "Liveness"         "Valence."         "Length."          "Acousticness.."  
    ## [13] "Speechiness."     "Popularity"

This is all documented in my SCRUM document where I go through each
change step by step.

*Genre*:

Contains the genre of the track. The data set has a wide variety of
genres that would be difficult to run analysis on, so I grouped them
into more general genres and so that there are not as many attributes in
the column. The final attributes of the column are *EDM, Hip Hop, Latin,
Pop, R\&B, Rap, and Reggaeton*.

### 2.Analysis of Data

#### 2.1 Top 50 Genres

Music genres are what categorize artists and allow fans to explore
others like them. While looking at this data and after preprocessing
something that because of interest was to see what genres were more
popular and if the genre made a difference in the likelihood of a song
being popular. The bar graph shows the distribution of songs genres and
the frequency of those songs amongst the data. The pie chart tells us
the proportion of those genres along with their corresponding
percentages. These statistics can help to determine what genres were
more popular in 2019 and which in this case we can conclude that pop
music was more popular.

    ## genre
    ##       EDM   Hip Hop     Latin       Pop       R&B       Rap Reggaeton 
    ##         6         5         5        25         1         4         4

![](FinalCS544_Rapisardi_files/figure-gfm/genre%20visuals-1.png)<!-- -->![](FinalCS544_Rapisardi_files/figure-gfm/genre%20visuals-2.png)<!-- -->

#### 2.2 Tempo Influence

The tempo of a song tells us how fast and upbeat it is. This can have a
big influence on how popular a song is. When initially computing the
frequencies, we can see that we have a large range of BPM in this data
set.

    ## bpm
    ##  85  88  90  92  93  94  95  96  98 100 101 102 104 105 110 111 114 117 124 130 
    ##   2   1   1   2   3   1   2   4   3   2   1   1   2   1   1   1   1   1   2   1 
    ## 135 136 138 140 150 152 154 158 176 180 190 
    ##   2   2   1   1   1   1   1   1   5   1   1

Displayed in the bar graph below 176 was the most popular BPM from the
data set, which is a very high value for this variable especially since
it has a mean of 120, and maximum value of 190. But, from this
individual analysis I was not able to see if there was any direct
correlation between BPM and the popularity of a song as there is no
prominent trend or distribution as shown below.

![](FinalCS544_Rapisardi_files/figure-gfm/bpm%20barplot-1.png)<!-- -->
To further look into the variable, the Central Limit Theorem was
processed which states, that the sample means from a sample of the
population will have a normal distribution. Below, determines if as the
sample size increases, we get a normal distribution for this variable.

    ## Sample Size =  90  Mean =  120  SD =  3.305424

    ## Sample Size =  100  Mean =  120  SD =  3.032363

    ## Sample Size =  150  Mean =  120  SD =  2.488487

![](FinalCS544_Rapisardi_files/figure-gfm/bpm%20CLT-1.png)<!-- -->

    ## Sample Size =  160  Mean =  120  SD =  2.423434

For this test a large sample size is used to compare what the
distribution for this data would look like if it was on the scale of
Billboard Top 200 or another popular chart. We can clearly see that as
the sample size increases the data starts to take on the shape of a
normal distribution. The mean and standard deviations for the sample
sizes are as follows.

Overall, we can say that if this data set were to be larger, let’s say
the top 200 songs, the BPM distribution for the data set would begin to
normalize itself and create a normal distribution curve.

#### 2.3 Rank Relationships

Although all 50 songs from the dataset were great there were obviously
some that were deemed better according to listeners. After analyzing the
genre and tempo of the songs in the dataset, the urge to find if there
were any other influential variables to the Rank seemed important to
understanding the data. This sections focus was mainly on the variable
Rank and the correlation it may have with other variables.

##### 2.3.1 *Rank and Danceability*

The first variable of interest is Danceability, this variable tells us
how easy it is to dance to a song. The higher the value the easier it is
to dance. First, I did some basic analysis using the summary function.

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   13.25   25.50   25.50   37.75   50.00

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   29.00   67.00   73.50   71.38   79.75   90.00

This function gives us some basic descriptive statistics, Rank isn’t
going to give us too much information and the main interest point is the
summary of Danceability. Below, these statistics have been marked on the
scatterplot showing the correlation between the two
variables.

![](FinalCS544_Rapisardi_files/figure-gfm/rank%20and%20dance%20plot-1.png)<!-- -->
This scatterplot shows a positive correlation between the two variables,
stating that as the danceability increases the rank increases or gets
higher in number. It can also be infered that you are less likely to be
able to dance to a song if the Rank is lower.

##### 2.3.2 *Rank and Energy*

The next variable that was used to find an influence on the rank was
energy. Energy is how energetic a song is, the higher the energy the
more energetic the song is. The same function was used to find basic
descriptive statistics on the variable. Below is the output from the
summary function.

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   13.25   25.50   25.50   37.75   50.00

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   32.00   55.25   66.50   64.06   74.75   88.00

As seen previously rank is the same whereas the output for energy
differs from that of Danceability. The range of energy is smaller
causing the 1st and 3rd quartiles to shift. These quartiles represent
the median of the lower and upper half of the data. Below we can see the
statistics marked on the scatterplot of the data.
![](FinalCS544_Rapisardi_files/figure-gfm/rank%20and%20energy%20plot-1.png)<!-- -->

After searching for a pattern in the data there was no conclusion on
whether or not the energy of a song influences the rank. The data in the
scatterplot is distributed in no specific pattern making it hard to find
a trend line.

The question of ‘What makes a good song?’ still goes unanswered but from
this analysis we can dig deeper into what other variables will influence
the ranking of songs. Although, we were able to conclude that
danceability certainly has an impact on the popularity of a song and may
even be linked to a specific genre. As seen in previous analysis Pop
music consumed 50% of the dataset. Since there are more songs with a
danceability value larger than the mean (71.38), we could make the
inference that Pop songs on the top 50 charts are more likely to have a
higher-than-average danceability value than other genres. Since energy
gave us no correlation, we cannot create any inferences from the data as
the pattern is unknown.

#### 2.4 Song Length Correlation with Rank

Over the years, there have been studies that impose the idea that the
human attention span is getting shorter. This influenced the music
industry as some artists have shortened the length of their songs to
keep the listener engaged and wanting to hear the chorus and hook as
fast as they can. Is this portrayed in the data? By looking at the
variable Length and using the Cumulative Distribution Function we can
see the distribution of the songs, identifying them by their ranks and
observing the relationship.

To gauge this the best, the standard deviation in reference to the mean
will give the most accurate reading of the data’s distribution. After
observing the data within three standard deviations of the mean, it was
discovered that 68% of the data fell within one standard deviation which
for this data is between 161 to 240 seconds.

Seeing that the data tends to distribute itself within one standard
deviation of the data, but is this distribution normal? If we were to
add more songs to the data set would this become clearer and create a
prominent trend in the dataset? Using the Central Limit theorem like
previously processed, we hope to understand the distribution of beats
per minute in the data. The samples of the population are centered
around the sample mean; in this case the sample mean is
201.

    ## Sample Size =  75  Mean =  201  SD =  4.694813

    ## Sample Size =  100  Mean =  201  SD =  4.035943

    ## Sample Size =  125  Mean =  201  SD =  3.494858

![](FinalCS544_Rapisardi_files/figure-gfm/song%20length%20vs%20rank%20CLT-1.png)<!-- -->

    ## Sample Size =  150  Mean =  201  SD =  3.199411

The above histograms show that the larger the sample size the more the
distribution mimics that of a normal distribution. The larger sample
sizes were chosen to relate to those of alternative music charts such as
Billboard Top 200. In those charts you have a larger data set to work
with which would increase the probability of a normal distribution.
Below is the mean and standard deviation for the data and respective
sample sizes.

From the above analysis it is clear that the distribution of songs and
their length falls within a certain range. Referring back to the genres
of the dataset we can make an inference about whether or not song length
is influenced by genre. Since 50% of our data falls into the Pop
category it would be more likely that a pop song falls within one
standard deviation of the mean than any other genre. Since pop songs
seemed to be more popular in 2019 there could be a relationship that pop
songs tend to stay within a range of 161-240 seconds to keep their
audience engaged, therefore becoming more popular. If we were to work
with a larger data set with a larger variation of genres and songs, we
might be able to make a conclusion on the relationship between genre and
song length and if they would be normally distributed.

#### 2.5 Picking a Song from the Top 10

Now that we have analyzed the top 50 songs, this section will mainly be
focused on the top 10 songs and their uniqueness using simple random
sampling.

Say the names of all the songs from the data set were placed in a bag
and 10 of the 50 songs were picked randomly without replacement. What
are the odds that you would pick one of the songs with a rank between 1
and 10? When the analysis was performed, two of the top 10 songs were
chosen as shown
    below.

    ##   Rank                      Track.Name  Artist.Name Genre Beats.Per.Minute
    ## 1    1                        Señorita Shawn Mendes   Pop              117
    ## 4    4 Beautiful People (feat. Khalid)   Ed Sheeran   Pop               93
    ##   Energy Danceability Loudness..dB.. Liveness Valence. Length. Acousticness..
    ## 1     55           76             -6        8       75     191              4
    ## 4     65           64             -8        8       55     198             12
    ##   Speechiness. Popularity
    ## 1            3         79
    ## 4           19         86

Now, we want to perform the same analysis but with replacement. When we
perform this analysis, we only get one record
    back.

    ##   Rank                      Track.Name Artist.Name Genre Beats.Per.Minute
    ## 4    4 Beautiful People (feat. Khalid)  Ed Sheeran   Pop               93
    ##   Energy Danceability Loudness..dB.. Liveness Valence. Length. Acousticness..
    ## 4     65           64             -8        8       55     198             12
    ##   Speechiness. Popularity
    ## 4           19         86

Initially looking at these results you may think that it seems
backwards. But, if you are picking the songs and replacing them, when
you receive a song that is in the top 10 of the data set you put it back
and have a chance of picking that song again, decreasing the chance of
variability in the sampling. Whereas if you are not replacing the songs
after picking them, although your likelihood of selecting a song in the
top 10 decreases, the likelihood of picking a different song in the top
10 is more likely.

These results tell us that the probability of picking a song from the
top 10, without replacement is 10% and the probability of picking a song
from the top 10 with replacement is 20%.

#### 2.6 Artist Info

Prior analysis has been focused on the Rank of a song, now we will pull
some basic information on the Artists of the data set. With a variation
of artist names, being able to easily sort and locate artists of a
certain name or starting with a certain letter can be helpful when
determining information on that artist and their song.

Starting off simple, *how many artists names start with an A?*

    ## 
    ##     Ali Gatie      Anuel AA Ariana Grande 
    ##             1             1             2

From the 50 songs in the dataset only three artist names start with an
‘A’ and one of those names occurs twice. The probability of randomly
selecting an artist with a name starting with ‘A’ is 8%.

What about artists that have names that *end with an A*?

    ## 
    ## Anuel AA   MEDUZA  ROSALÍA 
    ##        1        1        1

From the 50 songs in the data set only three artists have names that end
with an ‘A’ and there were no duplicates in this table. The probability
of randomly selecting an artist with a name ending in ‘A’ is 6%.

This function was also performed to find artists with *names starting or
ending with ‘R’*

    ## 
    ## ROSALÍA 
    ##       1

    ## < table of extent 0 >

When performed we can see that there was only one artist that’s name
started with the letter ‘R’ and there were no artists that’s name ended
with ‘R’.

This function allowed for good exploration of the data and helped to get
a better understanding of the variables. In a larger data set it could
be useful for grouping data and running analysis on those groups
specifically.

#### 2.7 Top 10 Features

Reverting back to the top 10 songs of the dataset we now understand the
likelihood of a song randomly being chosen from the top 10, but, are
there certain aspects that these songs have in common that make them
popular?

Using the tidyverse package, the first 10 rows were selected and
reassigned to the tibble spotify.top.10 which will be used for the
remainder of the analysis in this section.

To compute all of the descriptive statistics at once we use the summary
function, which produced the output
    below.

    ##       Rank                                 Track.Name        Artist.Name
    ##  Min.   : 1.00   bad guy                        :1    Ed Sheeran   :2   
    ##  1st Qu.: 3.25   Beautiful People (feat. Khalid):1    Anuel AA     :1   
    ##  Median : 5.50   boyfriend (with Social House)  :1    Ariana Grande:1   
    ##  Mean   : 5.50   China                          :1    Billie Eilish:1   
    ##  3rd Qu.: 7.75   Goodbyes (Feat. Young Thug)    :1    Lil Nas X    :1   
    ##  Max.   :10.00   How Do You Sleep?              :1    Lil Tecca    :1   
    ##                  (Other)                        :4    (Other)      :3   
    ##        Genre   Beats.Per.Minute     Energy      Danceability   Loudness..dB..  
    ##  EDM      :0   Min.   : 93.0    Min.   :43.0   Min.   :40.00   Min.   :-11.00  
    ##  Hip Hop  :1   1st Qu.:106.5    1st Qu.:62.5   1st Qu.:59.50   1st Qu.: -6.00  
    ##  Latin    :0   Median :126.0    Median :65.0   Median :72.50   Median : -5.50  
    ##  Pop      :6   Mean   :131.9    Mean   :65.1   Mean   :67.80   Mean   : -5.90  
    ##  R&B      :0   3rd Qu.:146.5    3rd Qu.:68.0   3rd Qu.:78.25   3rd Qu.: -4.25  
    ##  Rap      :2   Max.   :190.0    Max.   :81.0   Max.   :88.00   Max.   : -4.00  
    ##  Reggaeton:1                                                                   
    ##     Liveness        Valence.       Length.      Acousticness..   Speechiness. 
    ##  Min.   : 7.00   Min.   :18.0   Min.   :131.0   Min.   : 2.00   Min.   : 3.0  
    ##  1st Qu.: 8.00   1st Qu.:40.0   1st Qu.:177.8   1st Qu.: 5.75   1st Qu.: 7.5  
    ##  Median : 8.50   Median :58.5   Median :192.5   Median :10.50   Median : 9.5  
    ##  Mean   : 9.60   Mean   :54.1   Mean   :195.6   Mean   :14.50   Mean   :17.4  
    ##  3rd Qu.:10.75   3rd Qu.:68.5   3rd Qu.:201.0   3rd Qu.:14.25   3rd Qu.:26.5  
    ##  Max.   :16.00   Max.   :84.0   Max.   :302.0   Max.   :45.00   Max.   :46.0  
    ##                                                                               
    ##    Popularity   
    ##  Min.   :79.00  
    ##  1st Qu.:85.25  
    ##  Median :88.50  
    ##  Mean   :88.40  
    ##  3rd Qu.:92.00  
    ##  Max.   :95.00  
    ## 

Paying attention to the variables used for previous analysis we see that
the average BPM increased from 120 to 132, the average length of a song
decreased from 201 seconds to 196 seconds, and the average danceability
of a song decreased from 71.38 to 67.80.

Seeing that the BPM increased for the subset of data, further analysis
will aid in locating specific songs correlating to their BPM. First,
*which songs from the data have a BPM larger than 100?*

    ##                          Track.Name Rank   Artist.Name     Genre
    ## 1                          Señorita    1  Shawn Mendes       Pop
    ## 2                             China    2      Anuel AA Reggaeton
    ## 3     boyfriend (with Social House)    3 Ariana Grande       Pop
    ## 4       Goodbyes (Feat. Young Thug)    5   Post Malone       Rap
    ## 5 I Don't Care (with Justin Bieber)    6    Ed Sheeran       Pop
    ## 6                            Ransom    7     Lil Tecca   Hip Hop
    ## 7                 How Do You Sleep?    8     Sam Smith       Pop
    ## 8             Old Town Road - Remix    9     Lil Nas X       Rap
    ## 9                           bad guy   10 Billie Eilish       Pop
    ##   Beats.Per.Minute
    ## 1              117
    ## 2              105
    ## 3              190
    ## 4              150
    ## 5              102
    ## 6              180
    ## 7              111
    ## 8              136
    ## 9              135

Only 9 of the 10 songs from the data have a BPM \> 100.

*Which songs have a BPM larger than
    125?*

    ##                      Track.Name Rank   Artist.Name   Genre Beats.Per.Minute
    ## 1 boyfriend (with Social House)    3 Ariana Grande     Pop              190
    ## 2   Goodbyes (Feat. Young Thug)    5   Post Malone     Rap              150
    ## 3                        Ransom    7     Lil Tecca Hip Hop              180
    ## 4         Old Town Road - Remix    9     Lil Nas X     Rap              136
    ## 5                       bad guy   10 Billie Eilish     Pop              135

Five of the songs from the data have a BPM \> 125.

*Which songs have a BPM larger than
    150?*

    ##                      Track.Name Rank   Artist.Name   Genre Beats.Per.Minute
    ## 1 boyfriend (with Social House)    3 Ariana Grande     Pop              190
    ## 2                        Ransom    7     Lil Tecca Hip Hop              180

Two of the songs from the data have a BPM \> 150.

From this we can see that on average half of the data from this subset
has a higher BPM than the average of the whole population of the Spotify
dataset, therefore the increase in the average BPM is due to the
increase in songs with higher BPM. From this we can infer that songs
that are more popular tend to have a higher BPM.

Now we can address the length of the top 10 songs. Using similar
functions, we will determine which songs fall within certain time
intervals.

*Which songs are longer than 3 minutes (180
    seconds)?*

    ##                          Track.Name Rank   Artist.Name     Genre Length.
    ## 1                          Señorita    1  Shawn Mendes       Pop     191
    ## 2                             China    2      Anuel AA Reggaeton     302
    ## 3     boyfriend (with Social House)    3 Ariana Grande       Pop     186
    ## 4   Beautiful People (feat. Khalid)    4    Ed Sheeran       Pop     198
    ## 5 I Don't Care (with Justin Bieber)    6    Ed Sheeran       Pop     220
    ## 6                 How Do You Sleep?    8     Sam Smith       Pop     202
    ## 7                           bad guy   10 Billie Eilish       Pop     194

Seven of the songs from the data have a length \> 180 seconds.

*What songs are longer than 3 1⁄2 minutes (210
    seconds)?*

    ##                          Track.Name Rank Artist.Name     Genre Length.
    ## 1                             China    2    Anuel AA Reggaeton     302
    ## 2 I Don't Care (with Justin Bieber)    6  Ed Sheeran       Pop     220

Two of the songs from the data have a length \> 210 seconds.

*What songs are longer than 4 minutes (240 seconds)?*

    ##   Track.Name Rank Artist.Name     Genre Length.
    ## 1      China    2    Anuel AA Reggaeton     302

Only one song from the data has a length \> 240 seconds.

Overall, the decrease in song length for the subset of data is
influenced by the overall decrease in song lengths. From this we can
infer that shorter songs are more likely to be popular.

Assuming that our inference is correct, that shorter songs are more
likely to be popular, does the length influence the genre of a song?
Seeing as the data had more Pop songs that were popular further analysis
will conclude what the average song length each genre holds.

    ## # A tibble: 4 x 2
    ##   Genre     avg_length
    ##   <fct>          <dbl>
    ## 1 Hip Hop         131 
    ## 2 Pop             198.
    ## 3 Rap             166 
    ## 4 Reggaeton       302

Because we are working with a subset of data not all genres are going to
be included. The results contain four of the seven genres of which
Reggaeton songs had the longest average length, Pop following as the
second longest average length, then Rap, and Hip Hop had the shortest
average length. These values tell us that for these genres a song that
averages this length is more likely to be popular and fall in the top 10
charts.

Since there is an average length that a genre might hold that makes it
popular, is there an average BPM that a genre has that would make it
popular?

    ## # A tibble: 4 x 2
    ##   Genre     avg_bpm
    ##   <fct>       <dbl>
    ## 1 Hip Hop      120.
    ## 2 Pop          120.
    ## 3 Rap          120.
    ## 4 Reggaeton    120.

The data here shows that all of the genres in the subset have the same
average BPM. Therefore, we can conclude that the BPM for these genres
does not influence the popularity or rank of a song.

#### 4\. Conclusion

There were a lot of interesting statistics and trends found in this
dataset. I chose this dataset specifically because I have always had a
passion and interest in music and a career goal of mine would be to do
analysis for Spotify and find trends in data that would help artists be
successful. So, taking a look at some past record-breaking artists lets
discuss the results. Pop music was one of the most popular genres in
2019, with an average BPM of 120 and song length of 198 seconds. This
combined with the inference between rank and danceability a final
analysis would be that Pop songs, or songs that follow the outline of a
pop song are more likely to have a higher rank and be popular. This
analysis was derived from a smaller data set of only 50 rows so a larger
dataset would allow for further analysis and information about songs and
what makes a song a hit.
