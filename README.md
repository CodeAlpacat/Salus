# Salus


![logo](/uploads/40f23f8e19ca064b71518d3686fec23b/logo.png)

**목차**

## 1. SALUS DESCRIPTION

---

- **Service Name : Salus**
- **키오스크 URL :** [http://i7b110.p.ssafy.io:3000/](http://i7b110.p.ssafy.io:3000/)
- **APP 다운 URL :**

       [https://drive.google.com/file/d/1OjIm5ZZy87K3ajnTUy-o6TdM0h5MFl5g/view?usp=sharing](https://drive.google.com/file/d/1OjIm5ZZy87K3ajnTUy-o6TdM0h5MFl5g/view?usp=sharing)

- **Member**
    
    
    | 이름 | 역할 |
    | --- | --- |
    | 이원우 | Leader, FE |
    | 김지영 | FE |
    | 박성배 | BE |
    | 전상현 | IOT |
    | 정원석 | BE |
    | 황상윤 | FE |
- **Project Duration**
    - 2022.07.11 ~ 2022.08.19 (6주)

## 2. SALUS SERVER DEPLOYMENT

- **First**

    a) 서버 실행을 위한 명령어

        - ssh -i I7B110T.pem ubuntu@i7B110.p.ssafy.io

    b) 깃 리포지토리로 이동 

        - cd S07P12B110/

- **BackEnd**

    a) BackEnd폴더로 이동

        - cd BackEnd/

    b) 서버 실행

        - npm start

- **FrontEnd **

    a) FrontEnd 폴더로 이동(S07P12B110 위치에서)

        - cd FrontEnd

    b) 서버 실행 

        - npm start

- **IoT**

    a) .bashrc에 라즈베리파이를 부팅시 해당 코드를 실행하도록 설정되어 있음

    b) 밑의 명령어로도 코드 실행가능

        - cd /home/pi/Desktop/S07P12B110/IoT

        - python3 012.py

## 3. SALUS BACKGROUND

---

> 매일 발전하는 나를 위한 자동 운동 기록 서비스, **Salus**
> 
> - 운동 횟수를 까먹은 경험이 있나요?
> - 발전이 눈에 보이지 않으신나요?
> - 운동인으로서 이러한 상황에 대한 문제의식에서 시작했습니다.
> - 넌 운동만해 일기는 내가 쓸게

## 4. SALUS INFORMATION

---

> 저희 서비스, Salus는
> 
> - 운동 중량, 횟수, 시간을 자동으로 기록해 줍니다.
> - RFID 카드키를 통하여 출석 로그인 할수 있습니다.
> - 운동한 부위를 인체 그림으로 시각화하여 볼 수 있습니다.
> - 기록된 데이터를 기반으로 상체 하체 운동비율 통계를 제공하여 줍니다.
> - 출석 캘린더 페이지를 통하여 운동한 일자를 볼수 있습니다.
> - 운동 기구별 볼륨 성장치 통계를 볼 수 습니다.
>     
>     (자신과 비슷한 체구의 사람들의 평균 볼륨을 비교할 수 있습니다.)
>     
> - 모바일 연동을 통해 현재 진행중인 운동과 중량, 횟수, 시간 기록을 자동으로 기록해줍니다.
>     
>     (실시간으로 횟수와 시간이 올라가는 것을 확인할 수 있습니다.)
>     

## 4. SALUS TECHNOLOGY

---

![Untitled](/uploads/f29e33b2eff8cb4e33c0a64345c8593b/Untitled.png)



가. 이슈 관리 : JIRA

나. 형상 관리 : Git Lab

다. 커뮤니케이션: MatterMost, DisCord

라. 개발 환경:

1. OS : Window
2. IDE : Visual Studio Code
3. DataBase : MariaDB(HeidiSQL)
4. Server : AWS EC2
    1. ubuntu 20.04 LTS
    2. Socket.io 2.5.0
5. IoT
    1. Linux raspberrypi : 5.15.56
    2. Arduino : 1.8.19

마. 상세내용

1. BackEnd
2. Node : 16.16.0
3. express : 4.18.1
4. mybatis-mapper : 0.6.8
5. FrontEnd
    1. Node: 16.16.0
    2. React : 18.2.0
6. Mobile
    1. React-Native : 0.68.2
    2. expo : 45.0.0
7. IoT
    1. Python : 3.9.2

## 5. SALUS RESULT

---

### **키오스크**

- 키오스크 로그인 화면
    
    > RFID 키를 키오스크에 찍어 로그인이 가능합니다.
    > 
    
    ![image](/uploads/30c09ca22f4180313259839bb90cb6b7/image.png)
    

- 키오스크 메인 화면 (오늘의 운동기록이 없을 시)
    
    > 키오스크 메인화면에서는 운동한 근육부위를 시각적으로 볼 수있고 유산소, 상체, 하체, 운동시간등을 헬스장 이용고객의 평균과 비교해서 볼 수 있습니다.
    (지난 5일 동안 어느 부위를 했는지 한 눈에 파악할 수 있게 보여줍니다.)
    > 
    
    ![image](/uploads/66a00148aafafbc668e276106cacd04a/image.png)
    

- 키오스크 메인화면 (오늘 운동기록이 있을시)
    
    > 운동을 한 뒤에 보면 어떤 운동을 했고 그 운동의 부위가 어딘지 파악할 수 있으며 5일간의 운동기록들도 클릭하여 볼 수 있습니다.
    (어떤 머신으로 몇번을 하였고 총 Volume 은 어떻게 되는 지 확인할 수 있습니다. )
    > 
    
    ![image](/uploads/be0e6064bb4ef18172e3fa6d3b608e4a/image.png)
    

- 키오스크 메인화면 (Calender 선택시)
    
    > Calendar를 클릭하면 한달간 운동을 한 부위(상체, 전신, 하체)와 출석기록을 볼 수 있습니다.
    > 
    
    ![image](/uploads/e39e92a9ef49b1780caaeaa4edffe35b/image.png)
    

- 키오스크 한달간의 운동 기록 확인
    
    > “렛 풀다운 머신”을 클릭하면 지난 5개월간의 월간 Volume 을 파악할 수 있으며 자신과 비슷한 체형의 사람들의 평균 Volume을 비교할 수 있습니다.
    > 
    
    ![image](/uploads/22ea54c5b9684bea74dddf2356a0f2ca/image.png)
    

### **모바일**

- 모바일 로그인 화면
    
    > 회원 이메일과 헬스장에서 등록 한 RFIDKEY 를 입력해주면 로그인이 됩니다.
    > 
    
    ![image](/uploads/a05b0413e53357a2a457791db87e8399/image.png)
    

- 모바일 메인 페이지
    
    > 모바일 메인 페이지 에서는 이번 주 운동(불륨)과
    이번 주 목표들을 확인 할 수 있습니다.
    이번 주 시간과 목표를 누르면 시간과 목표를 재설정할 수 있고
    운동, 캘린더 버튼을 누르면 각 페이지로 연결됩니다.
    > 
    
    ![image](/uploads/cb25956ee19813bdb19fa2a03c72da0e/image.png)
    

- 이번 주 목표 시간 설정
    
    > 이번 주 목표 시간 설정 페이지에서는 현재 설정된 목표 시간이  먼저 나오고
    시간, 분을 조정하여 이번 주 목표 시간을 재설정할 수 있습니다.
    > 
    
    ![image](/uploads/d26c273572b2ca27ce83fac345e46831/image.png)
    

- 이번 주 목표 볼륨 설정
    
    > 이번 주 목표 불륨 설정 페이지에서는 현재 설정된 불륨이  먼저 나오고
    불륨을 조정하여 이번 주 목표 불륨을 재설정할 수 있습니다.
    > 
    
    ![image](/uploads/e21cf405455ad0776e88e8a9da396197/image.png)
    

- 실시간 운동 기록
    
    > 운동 버튼을 클릭 시 이동되는 실시간 운동 기록 페이지입니다.
    양방향 소켓 통신을 이용해서 사용자가 운동 기구를 이용할 때
    중량과  횟수와 시간 그리고 칼로리를 보여줍니다.
    횟수는 사용자가 운동 기구를 당길 때 횟수가 증가됩니다.
    > 
    
    ![image](/uploads/be448b766149027e87361104f8da44e9/image.png)
    

- 실시간 운동 누적 기록
    
    > 실시간으로 오늘 운동한 누적 기록이 카드형태로 보여줍니다.
    > 
    
    ![image](/uploads/51c7d826a72bb2d7fe982f6dcefcd7f5/image.png)
    

- 모바일 캘린더 화면
    
    > 모바일 메인 페이지 화면에서 캘린더 버튼을 누르면 이동되는 캘린더 페이지입니다.
    캘린더 페이지에서는 유저가 출석한 날짜를 볼 수 있으면 해당 날짜를 클릭하면 
    그 날 운동 했던 종합 기록과 각 기구 기록들을 보여줍니다.
    달력 이동을 통해 과거의 기록도 볼 수 있습니다.
    > 
    
    ![image](/uploads/aca5aa1cc6f5fec3fed15c65314e88f1/image.png)
    

### IoT

- 로드셀
    
    ![image](/uploads/279b7312fc4d0afbf479b4b0f4ebcea7/image.png)
    

- RFID 리더기+Raspberry Pi+Arduino + 스피커모듈
    
    ![image](/uploads/06094c509daab6a19c20462a8ecd288c/image.png)
