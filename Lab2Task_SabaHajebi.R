#Code for Multiple Monte Carlo Games
n_stay <- 0                                             #number of times the person got the car by staying                            
n_switch <- 0                                           #number of times the person got the car by switching
random_wins <- 0                                        #number of times the person got the car by random

for ( i in 1:100) {                                     #initializes a loop to to see how the game turns out over multiple plays
  door <- c(1,2,3)                                      #creates a vector named door that contains the numbers 1, 2, and 3.
  cardoor <- sample(door,1)                             #randomly select one of the doors to have the car behind it with the following code. 
  choice <- sample(door,1)                              #to randomly select the contestants choice of door using similar code.
  goatdoors <- setdiff(door, cardoor)                   #new vector that holds the values corresponding to goats
  reveal_options <- setdiff(goatdoors, choice)          #identify the options we have for the reveal 
  if (choice == cardoor) { 
    reveal <- sample(reveal_options,1)                  #we select one random situation and assign it to the variable reveal.
  } else {
    reveal <- reveal_options                            #If the user did not pick the door then make the reveal equal to the reveal options
  }
  remaining_doors <-setdiff(door, reveal)               #create a new vector which identifies the two remaining unrevealed doors
  newchoice <- setdiff(remaining_doors, choice)         #new variable recording the final choice of door if the contestant switches.
  
  if (choice == cardoor) {                              #If the user picked the car door originally
    n_stay <- n_stay + 1                                #increment the number of time they got the car by staying
  }
  
  if (newchoice == cardoor) {                           #If the user had to switch the achieve the cardoor
    n_switch <- n_switch + 1                            #increment the number of times they got the car by switching
  }
  if(random_choice == cardoor) {
    random_wins <- random_wins + 1                        #increment the number of times the random user one the car
  }
  
  if (choice == cardoor) {                                #If the user picked the car door originally, print out message
    print("Stay: You got a car")                          
  } else {                                                #if they didn't win, print out message
    print("Stay: You got a goat")
  }
  if (newchoice == cardoor) {                             #If the user had to switch the achieve the cardoor, print out message
    print("Switch: You got a car")
  } else {                                                #if they didn't win, print out message
    print("Switch: You got a goat")
  }
  
}

print(n_stay/100)                                       #Print the percentage of times they got the car by staying             
print(n_switch/100)                                     #Print the percentage of times they got the car by switching
print(random_wins/100) #Print the percentage of times the random user won the car
