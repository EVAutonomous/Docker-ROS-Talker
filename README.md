# Docker-ROS-Talker

Install VSCode: https://code.visualstudio.com/download?_exp_download=d53503e735

Install Docker: https://www.docker.com/get-started/

Create a Docker login in and note down your username

Create a new folder in your machine

Open the terminal and navigate into the folder that you have created

For example, if my code was in the Downloads folder in a folder called “EVConcept26” , do the following:

cd ./Downloads/EVConcept26

Now in the same terminal run the following: 
```
git clone https://github.com/EVAutonomous/Docker-ROS-Talker.git
```

You should now be able to see the code in your local machine

Open VSCode and choose the open folder button. Navigate all the way into the subfolder that has the github repository you just cloned

Should we make them do it in VSCode or direct terminal?

Now run:
```
docker compose up -d
```

Open two terminals in your laptop and ensure that both of them have the current directory set to the same one where your code is. 

In one of them run these two commands:
```
docker exec -it ros2-demo bash
```
Make sure that you've pressed enter and then run this one
```
ros2 run demo_nodes_cpp listener
```

In the second terminal run these two commands:
```
docker exec -it ros2-demo bash
```
Make sure that you've pressed enter and then run this one
```
ros2 run demo_nodes_cpp talker
```

You should see messages of "Hello World" being sent from one terminal and the other terminal echoing the same. 

Congrats, you have now implemented a simple publisher-subscriber architecture in ROS2!
