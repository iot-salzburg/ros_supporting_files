#include <cmath>
#include <iostream>
#include <franka/exception.h>
#include <franka/robot.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char** argv) {
    franka::Robot robot(argv[1]);
  try {
        size_t count = 0;
        std::array<double, 7> currentPosition;

        robot.read([&count, &currentPosition](const franka::RobotState& robot_state) {

            std::cout << "Measured joint positions:" << std::endl;
            for (int i = 0; i < 7; i++){
                printf("[%i] %+f \n", i, robot_state.q[i]);
            }
            currentPosition = robot_state.q;
            return count++ < 1;
    });

    std::array<double, 7> piFactors;
    
    for(int i=0; i<7; i++){
        piFactors[i] = currentPosition[i] * 180 / M_PI;
    }

    std::cout << "Calculated Pi Factors" << std::endl;
    for (int i = 0; i < 7; i++){
        printf("[%i] %+f \n", i, piFactors[i]);
    }

    for(int i=0; i<7; i++){
        piFactors[i] = round(piFactors[i]);
    }

    std::cout << "Rounded Pi Factors" << std::endl;
    for (int i = 0; i < 7; i++){
        printf("[%i] %+f \n", i, piFactors[i]);
    }

    }
   catch (const franka::Exception& ex) {
    std::cerr << ex.what() << std::endl;
    std::cin.ignore();
    robot.automaticErrorRecovery();
  }

  std::cout << "Press Any Key to close.." << std::endl;
  std::cin.ignore();
  return 0;
    
}