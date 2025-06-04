

Observer Pattern- Used the observer Pattern to allow cards to use actions from the state of the game

 FlyWeight Pattern - I used the flyweight pattern for cards as you just have to set variablesfor the card rather than creating a new object for each card and also added to function call to the cards variable
 
 Zac (Professor)
 Talked about my code, recommended that I use folders for card functions and have a unique file for each card type, also recommended that I have the each card track which side of the field its on (aka enemy or ally) so 
 I dont have to pass so many variables in each call of a cards function. Overall my conversation with him lead to me organzing my functions and making more files, and gave me better ideas of how to restructure the code for the future when we revamp this project.
 
 Drew
 When we were making the spreadsheet we talked about how to call each cards function and how to structure the games state. Using this conversation we both worked out the structures of the cards functions and how to best tackle
 the function call for the more complicated cards like medusa. Although I didnt add medusa having and understanding of such a complex card made the others easier. The most important part of this assignment in my opinion 
 is how you handle the function calls of the unique cards and this coversation is how I came up with the idea to use function calls with the observer pattern to best tackle this problem
 
 Evan
 Midway through the assignment I talked to him on how to best handle the structure of the game. At the time it wasnt done entirelly so he helped me refine the game states and use less functions. For instance he made me make
 the start function instead of putting the early tasks in load to help make it look cleaner and make the project more scalable as I could in theory make a reset button.
 
 
 Overall Im proud of how I handled a lot of the aspects of the actual game state however I think a lot of refinement can be done with the card logic. Overall I'd like to use the observer pattern more and have cards
 simply take input of current gamestate and act off that, for instance if the mida card takes a reveal state it will act on it. I can see issues stemming from this such as calling reveal multiple times but I plan to work on 
 this for project 4 as I really want clean logic for the card function calls.
 
 Card Back - https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgglounge.pt%2Fwp-content%2Fuploads%2F2022%2F12%2FYu-Gi-Oh-Card-Back-Sleeves-Japanese-Size.jpeg&f=1&nofb=1&ipt=59435d9b26bb93c352e4227a62a5aae10ffc15c7a8d489092ebf9521b0399f40
 
 
Grass - https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fart.pixilart.com%2F02aa0790086f91a.png&f=1&nofb=1&ipt=97fdf26f376434e3272ca6a1b21abcad290dad4fc036ad241386ebd6e9b86dd5

water -  https://img.itch.zone/aW1hZ2UvMTkzMDQ1Ni8xMTM0OTY1OS5qcGc=/original/Bdb0L0.jpg

volcano - https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpreview.redd.it%2Fvolcanic-eruption-in-the-style-of-pixel-art-v0-ca0dl2tgceba1.png%3Fwidth%3D1024%26format%3Dpng%26auto%3Dwebp%26s%3D5f68d75ccdc7c5712a95b9d4358914b82430b11a&f=1&nofb=1&ipt=c8e9a77c75ead02cb493113725e54b709fc979a0192739e28a5c70b242edde76