# UCSI Queue System

## Group Member List
1. Daniel Ryan Sunjaya 1001851873
2. Steven Wong 1001748707
3. Law Yenchin 1001850247
4. Lee Hui Yung 1001851242

## Title
Queue Applicaiton

## Introduction
Queuing is a feature of modern life that we experience at every turn of our daily lives. The basic phenomena of queueing occurs whenever a shared facility needs to be utilized for service by a large number of jobs or customers, whether it happens at the grocery checkout counter or when accessing the Internet (K. Bose, S., 2022). The mathematical study of the development, function, and congestion of waiting lines, or queues, is known as queueing theory. A queue scenario has two aspects at its core. The customer, job, or request are all terms used to describe someone or something who demands a service. The server refers to the person or thing that completes or provides the services (Queue-it logo. 2022).

Queuing models look at how customers are served. Arrival procedure, behavior, how customers are served, service discipline, and waiting room are all components of a queuing system. The arrival procedure. The arrival process refers to the manner in which clients arrive. They may queue individually or in groups, and they may arrive at predetermined intervals or at random. Behavior, when clients are in line, how do they act? Some people may be willing to wait for their turn in line, while others may become irritated and leave. Others may choose to rejoin the queue later, for example, if they are placed on hold with customer service and decide to call back in the hopes of receiving faster service. The manner in which consumers are served. This covers the time it takes to serve a customer, the number of servers available to assist them, whether customers are served one at a time or in batches, and the sequence in which they are served, also known as service discipline. The rule by which the next customer is chosen is referred to as service discipline. Although the "first come, first served" guideline is used in many retail scenarios, other circumstances may necessitate different forms of service. Customers may be served in order of priority or according to the quantity of goods they require service for. The last customer to arrive is sometimes served first. The waiting area. Depending on the amount of available space, the number of consumers allowed to wait in line may be limited (Lim, A., 2018).

Why the queueing theory is important? Waiting in line is a common occurrence in everyday life because it serves various key functions as a process. When there are limited resources, queues are a fair and necessary manner of dealing with the flow of clients. If there isn't a queuing process in place to deal with overcapacity, bad things happen. For example, if a website has too many visitors, it will slow down and fail if it does not include a mechanism to adjust the speed at which requests are processed or a way to queue visitors. Queuing theory is significant because it helps characterize queue characteristics such as average wait time and gives tools for queue optimization. Queuing theory influences the design of efficient and cost-effective workflow systems from a commercial standpoint (Queue-it logo. 2022).

Back to the point, this project is to develop a queue application for UCSI university’s student office. Due to the queue system is use for UCSI university, so the project team had created a login and register page for the queue system, because want to capture the student information directly and also avoid people joking using this queue application. There will be two users which are students and admin. For the admin user, their information will already save in the firebase so that they don’t need to register but can straight away login. From the application, students can choose which the department they want, because it will be easy when the officer directly knows the user’s purpose. Student and admin can view different page of the system which admin can see the backend of the system. Students can get the number to queue up based on what’s the department they choose. After the student queue up for the specific department, they can see from their queue number and current number to know how many students left. Besides that, when the admins have settle the enquiry for the previous student, they need to click “next” button to turn to next queue number and let the next students to enquiry their matter. When the admin clicked the “next” button, the current queue from the student view also will be updated. 

## Motivation
The motivation of doing the queue system is because the traditional queue system of UCSI University which is using a machine to take number always got problem, such as the button can’t works and some student also will simply press the button without knowing the service. From here, it will cause wasting time as other student need to wait long time. By using the queue system that the project team developed, students can just use this queue system to queue up by taking number for the app. Besides of that, as now is still in Covid-19 pandemic, using the apps but not physically touch the machine will be more suitable for now. 

## Aim
The aim of this project is to develop a queue system for UCSI university’s student office. There will be three related department which is Visa Processing Unit (VPU), Finance, and Student Registration. 

## Objectives
- To design a queue system
- To develop a queue system


## Features and functionalities
### Registration and Login function
This application provides registration and login function which is users which are admin and students. Admin can straight away using their email and password to login into the backend of the app, but the students need to register first by filling up their full name, student ID, email, and password. 

### Multiple Department Services
There will be three department will in charge of it which are Visa Processing Unit (VPU), Finance, and Student Registration. From here, students can clicking the related button to choose which department that they want to enquiry. 

### Show user’s and current queue number
The system will show the current queue number for each of the department. When the student chooses the department they want and get their queue number, they can know how many students more then will turn to them. Therefore, this is convenience to the student which doesn’t wasting time to keep waiting on the waiting area, but they can request to queue number first when they haven’t reach the office. 

## Future Development
The developers plan to build the application which can notify user when it comes to their number. By giving it, user can go around for a while when it is on the long queue. However, the application need to be tested for a while to see the real time queuing display where it can be improved in the future.


## References 
K. Bose, S., 2022. An lntroduction to Queueing Systems. [online] Link.springer.com. Available at: <https://link.springer.com/content/pdf/bfm%3A978-1-4615-0001-8%2F1.pdf> [Accessed 5 April 202 2].

Queue-it logo. 2022. Queuing theory: Definition, history & real-life applications. [online] Available at: <https://queue-it.com/blog/queuing-theory/> [Accessed 5 April 2022].

Lim, A., 2018. Queuing Theory: The Mathematical Study of Waiting in Line. [online] ThoughtCo. Available at: <https://www.thoughtco.com/queuing-theory-4171870> [Accessed 5 April 2022].


