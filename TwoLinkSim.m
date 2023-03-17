% Define link lengths
L1 = 0.5;
L2 = 0.5;

% Define joint angles
theta1 = linspace(0, pi/4, 100);
theta2 = linspace(0, pi, 100);

% Calculate end effector position
x = L1 * cos(theta1) + L2 * cos(theta1 + theta2);
y = L1 * sin(theta1) + L2 * sin(theta1 + theta2);

% Plot robot arm movement
figure
hold on
plot(x, y)
axis equal
xlabel('X')
ylabel('Y')
title('Two-Link Robot Arm Movement')

% Plot robot arm
for i = 1:length(theta1)
    % Calculate joint positions
    joint1_x = L1 * cos(theta1(i));
    joint1_y = L1 * sin(theta1(i));
    joint2_x = joint1_x + L2 * cos(theta1(i) + theta2(i));
    joint2_y = joint1_y + L2 * sin(theta1(i) + theta2(i));
    
    % Plot links
    plot([0, joint1_x], [0, joint1_y], 'r', 'LineWidth', 2)
    plot([joint1_x, joint2_x], [joint1_y, joint2_y], 'r', 'LineWidth', 2)
    
    % Plot joints
    plot(0, 0, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b')
    plot(joint1_x, joint1_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b')
    plot(joint2_x, joint2_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b')
    
    % Pause for animation
    pause(0.1)

end
hold off
