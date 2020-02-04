## Expectations
* There are no exercises, only technical papers to read.
* Study in exercise period.

## Examination

* Individual written assignment
* Composed of 5 questions
    - 3 questions from part 1 (2/3 weight)
    - 2 questions from part 2 (1/3 weight)
    - Announced in May
* Plenty of time to write

## Criteria for Evaluation
* Correctness
* Coverage
* Depth
* Presentation (format, writing, &c.)
* Novelty

NB: Plagiarism is not allowed, &c.

## Introduction

* Early mobile computer
* Mobile phones (early 1990s) 
* Initially two tangents, mobile computing, wireless communication
* Today they are one. (Smartphone, Smartwatch, PDA, Lappys)

### Definition of Mobile
* Mobile: Ability to be on the move, mobile applications are apps that can be used on the move
* Wireless: The transmission of data over radio waves. Wireless can send/ receive data.
* Mobile but not wireless: Gameboy, calculator.

### Variability of the Mobile Environment
* A 3D coordinate system model
- Mobility
    - Stationary
    - Nomadic - Pedestrian speed
    - Mobile - Vehicular speed
    - Roaming - Mobile across network
- Device Capability
    - Form factor
    - GUI
    - Multimedia
    - Real-time multimedia
- Connectivity
    - Connected
    - Semi-connected (asymmetric)
    - Disconnected

### Roles in Mobile Environment
- Wireless operators and service providers
- Device manufacturers
- Hardware vendors
- ***Software infrastructure providers***
- ***Independent software vendors***
- ***System integrators***

### Mobile vs Wireless
- Today most mobile apps are wireless, use internet for mobile apps. (seems pretty implicit????)
- 

### SoLoMo (Social, location, Mobile)
> The intersection of social, location and mobile.
Consider the different applications of the available data in mobile applications.

### Mobile OSes
* Pretty much just open source android vs brainwash apple
* Mentions the typical development platforms
* Android: Java/ kotlin <--- Focus bliver på android
* Windows Phone: var C#/ .net
* Hun nævnte ikke Apppple

#### Android Architecture
- Showed a nice graph of android arch (Picture??)
- Android runtime (Dalvik)
    - Spent a while on it, might be relevant.

Register based vs Stack Machine

#### Cross platform tools for development:
- RubyMotion, Xamarin, React Native, Flutter

### Mobile Software architecture
- Standalone (local app on device)
- Client-Server (C/S)
  - WWAN, WLAN based
- Peer-to-peer (P2P)
  - Devices are connected by short-range wireless communication means like wifi or bluetooth
- Hybrid (automatically chooses C/S or P2P)


#### Client/Server Architecture
|Client Type|Heavy Computation|
|-|-|
|Thin|Performed on the server|
|Fat|Performed locally|

##### WLAN C/S
- Uses access points to create the network. Gateway to access the webz

#### Peer-to-Peer
- No dedicated servers, client to client communication, any device can be a provider.
- Data may be relayed across different devices.

