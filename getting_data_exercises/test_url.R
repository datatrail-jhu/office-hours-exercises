# C. Savonen 

# Test if a URL exists 

test_url <- function(url) {
  # Tests if URL is able to be retrieved
  #
  # Args:
  #   url: a URL to test whether it exists. 
  #
  # Returns:
  #   a Logical TRUE/FALSE on whether it exists. 
  
  message(paste0("Testing: ", url))
  
  url_status <- try(httr::GET(url), silent = TRUE)
  
  status <- ifelse(suppressMessages(grepl("Could not resolve host", url_status)), FALSE, TRUE)
  
  status <- ifelse(httr::status_code(httr::GET(url)) == 404, FALSE, TRUE)
    
  return(status)
}

# Tests for this function: 

# Should print out TRUE
test_url("https://www.datatrail.org/")

# Should print out FALSE
test_url("https://www.fakeurlauisdbviuabsduivbaiu.com")

# Should fail because 404
test_url("https://github.com/jhudsl/intro_to_r2")
