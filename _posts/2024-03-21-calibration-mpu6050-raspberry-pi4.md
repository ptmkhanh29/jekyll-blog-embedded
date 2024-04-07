---
title: Hiệu chuẩn cảm biến MPU6050 dùng Rasberry Pi 4
date: 2024-03-21 20:34:00 +0530
categories: [Raspberry Pi, MPU6050]
tags: [raspberry-pi, python, mpu6050, embedded]
author: khanhphan
img_path: "/assets/img/calibration-mpu6050-raspberry-pi4/"
image:
  path: "over-project.jpg"
  alt: "Calibration IMU senser MPU6050 using Rasberry Pi 4"
pin: true
---
Đây sẽ là bài viết đầu tiên của mình về series liên quan đến cảm biến IMU MPU6050. 

Mình ít thấy có bài viết nào nói về việc hiệu chuẩn cảm biến MPU6050 trước khi lấy dữ liệu nên hôm nay bài viết này mình sẽ tập trung vào quá trình hiệu chuẩn cảm biến. 

Dù là cảm biến có tốt đến đâu, xịn xò ra sao thì cũng không tránh được sai số trong quá trình sản xuất, hoặc sai số xuất hiện theo thời gian hay do tác động của các yếu tố bên ngoài. Riêng con cảm biến MPU6050 này, mình thấy sai số của nó cũng khá cao, đâu đó 3 độ, thường mấy bạn đọc source code sẽ thấy code được define offset x,y,z, thì đó chính là phần bù được cộng vào để đưa các góc về gần bằng 0 nhất có thể.

Nói lan man dài dòng quá, cuối cùng, mục đích của hiệu chuẩn cảm biến, là để nó giúp xác định và điều chỉnh sai số để đảm bảo dữ liệu cảm biến là chính xác.

Ok, giới thiệu đã xong, bài viết này mình sẽ cố gắng hướng dẫn chi tiết nhất có thể (dù nó cũng hong có gì khó) từ setup phần cứng, enable I2C trong Pi 4, cho đến run code Python trong Pi (cái này quá dễ luôn)

## MPU6050 giao tiếp với Rapsberry Pi

Kết nối phần cứng theo sơ đồ dưới đây: Kết nối I2C giữa Raspberry Pi với cảm biến MPU6050, kết nối chân SCL và SDA. 

Con Pi 4 của mình sẽ được cắm thêm nguồn ngoài 5.1V và cáp ethernet để giao tiếp với máy tính.

![image wiring](../calibration-mpu6050-raspberry-pi4/wiring-pi-imu.jpg)

## Why Notebook?

> **For Beginners:** Notebook provides a safe and supportive environment for newcomers to the tech world. Dive into our rich collection of articles, tutorials, and guides created by experienced developers. Learn at your own pace and level up your skills.
{: .prompt-tip }

> **For Experts:** Notebook offers a space for seasoned developers to contribute their knowledge and insights. Share your wisdom, best practices, and innovative ideas with a global community of learners.
{: .prompt-tip }

### A Win-Win for All

At Notebook, we believe in the power of learning through collaboration. Our platform fosters a win-win situation where beginners gain valuable knowledge, and experts have the satisfaction of helping others on their journey.

![win-win picture](win-win.jpeg)

## Get Started!

- **Explore Content:** Start by browsing our extensive library of technical articles. You'll find a wide range of topics, from coding tips to software development trends.
- **Contribute:** If you're an experienced developer, consider contributing your own articles. Sharing your expertise can make a real difference in someone's learning journey.
- **Join the Community:** Connect with fellow developers, ask questions, and engage in discussions in our community forum. We're here to support each other.
- **Stay Updated:** Don't miss out on the latest content and updates. Follow us on GitHub Organization stay in the loop.

![getting-started-img](getting-started.jpeg)

Whether you're here to learn or share, Notebook is your hub for all things tech. Let's grow together!

**Ready to embark on your developer's journey? Start exploring Notebook now!**

> **For Contributors:** Checkout the [**Contribute to Notebook**](../contribute-to-notebook "Goto post contribute-to-notebook") for more details regarding contributing to this open source.
{: .prompt-info}
