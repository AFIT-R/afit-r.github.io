        ungroup()
        
frequency
```

```
## # A tibble: 63,651 × 5
##                    book     word     n book_words  all_words
##                  <fctr>    <chr> <int>      <dbl>      <dbl>
## 1    Chamber of Secrets    harry  1503 0.04470420 0.04044824
## 2   Prisoner of Azkaban    harry  1824 0.04428474 0.04044824
## 3   Philosopher's Stone    harry  1213 0.04243484 0.04044824
## 4     Half-Blood Prince    harry  2581 0.04090462 0.04044824
## 5        Goblet of Fire    harry  2936 0.04040571 0.04044824
## 6  Order of the Phoenix    harry  3730 0.03854222 0.04044824
## 7       Deathly Hallows    harry  2770 0.03773533 0.04044824
## 8    Chamber of Secrets      ron   650 0.01933315 0.01404707
## 9   Prisoner of Azkaban      ron   690 0.01675245 0.01404707
## 10      Deathly Hallows hermione  1077 0.01467183 0.01199986
## # ... with 63,641 more rows
```


We can visualize this 


```r
ggplot(frequency, aes(x = book_words, y = all_words, color = abs(all_words - book_words))) +
        geom_abline(color = "gray40", lty = 2) +
        geom_jitter(alpha = 0.1, size = 2.5, width = 0.3, height = 0.3) +
        geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
        scale_x_log10(labels = scales::percent_format()) +
        scale_y_log10(labels = scales::percent_format()) +
        scale_color_gradient(limits = c(0, 0.001), low = "darkslategray4", high = "gray75") +
        facet_wrap(~ book, ncol = 2) +
        theme(legend.position="none") +
        labs(y = "Harry Potter Series", x = NULL)
```

<img src="/public/images/analytics/descriptives/tidy_text2.png" style="display: block; margin: auto;" />

Words that are close to the line in these plots have similar frequencies across all the novels. For example, words such as "harry", "ron", "dumbledore" are fairly common and used with similar frequencies across most of the books. Words that are far from the line are words that are found more in one set of texts than another. Furthermore, words standing out above the line are common across the series but not within that book; whereas words below the line are common in that particular book but not across the series. For example, "cedric" stands out above the line in the Half-Blood Prince.  This means that "cedric" is fairly common across the entire Harry Potter series but is not used as much in Half-Blood Prince.  In contrast, a word below the line such as "quirrell" in the Philosopher's Stone suggests this word is common in this novel but far less common across the series.

Let’s quantify how similar and different these sets of word frequencies are using a correlation test. How correlated are the word frequencies between the entire series and each book?


```r
frequency %>%
        group_by(book) %>%
        summarize(correlation = cor(book_words, all_words),
                  p_value = cor.test(book_words, all_words)$p.value)
## # A tibble: 7 × 3
##                   book correlation p_value
##                 <fctr>       <dbl>   <dbl>
## 1      Deathly Hallows   0.9703948       0
## 2    Half-Blood Prince   0.9703266       0
## 3 Order of the Phoenix   0.9844414       0
## 4       Goblet of Fire   0.9793959       0
## 5  Prisoner of Azkaban   0.9641515       0
## 6   Chamber of Secrets   0.9656789       0
## 7  Philosopher's Stone   0.9551352       0
```

The high correlations, which are all statistically significant (p-values < 0.0001), suggests that the relationship between the word frequencies is highly similar across the entire Harry Potter series.  
