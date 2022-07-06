function sysCall_init()
    -- do some initialization here
    noseSensor=sim.getObjectHandle('sonar')
    max_dist=1
    

function onSpeedChange(uiHandle, id, newValue)
    speed=newValue*max_speed/100
    move(speed,turn)
end
function onTurnChange(uiHandle, id, newValue)
    turn=newValue*max_turn/100
    move(speed,turn)
end

function move(v,w)
    sim.setJointTargetVelocity(left_wheel_1,(v-b*w)/wheel_radius)
    sim.setJointTargetVelocity(left_wheel_2,(v-b*w)/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_3,(v+b*w)/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_4,(v+b*w)/wheel_radius)
end
function moveForward()
    sim.setJointTargetVelocity(left_wheel_1,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(left_wheel_2,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_3,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_4,0.5*max_speed/wheel_radius)
    
end
function moveBackwards()
    sim.setJointTargetVelocity(left_wheel_1,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(left_wheel_2,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_3,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_4,-0.5*max_speed/wheel_radius)
end
function turnLeft()
    sim.setJointTargetVelocity(left_wheel_1,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(left_wheel_2,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_3,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_4,0.5*max_speed/wheel_radius)
end
function turnRight()
    sim.setJointTargetVelocity(left_wheel_1,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(left_wheel_2,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_3,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel_4,-0.5*max_speed/wheel_radius)
end
function stop()
    sim.setJointTargetVelocity(left_wheel_1,0)
    sim.setJointTargetVelocity(left_wheel_2,0)
    sim.setJointTargetVelocity(right_wheel_3,0)
    sim.setJointTargetVelocity(right_wheel_4,0)
    end

function stop2()
   sim.setJointTargetVelocity(brush,0)
    end
  function start()
  sim.setJointTargetVelocity(brush,0.5*max_speed/wheel_radius)
    end  

end

function sysCall_actuation()
    -- put your actuation code here
    
    left_wheel_1=sim.getObjectHandle('joint_1')
    left_wheel_2=sim.getObjectHandle('joint_2')
    right_wheel_3=sim.getObjectHandle('joint_3')
    right_wheel_4=sim.getObjectHandle('joint_4')
    brush=sim.getObjectHandle('joint_5')
    wheel_radius=0.1
    max_speed=10
    max_turn=10
    speed=0
    turn=0
    b=10
    
    
        ui=simUI.create('<ui enabled="true" modal="false" title="arduino robot car" closeable="true" layout="vbox" placement="relative" position="20,20">' ..
    '<button enabled="true" text="Forward" on-click="moveForward"></button>' ..
    '<button enabled="true" text="Backwards" on-click="moveBackwards"></button>' ..
    '<button enabled="true" text="Left" on-click="turnLeft"></button>' ..
    '<button enabled="true" text="Right" on-click="turnRight"></button>' ..
    '<button enabled="true" text="Stop" on-click="stop"></button>' ..
    '<button enabled="true" text="Stop brush" on-click="stop2"></button>' ..
    '<button enabled="true" text="start brush" on-click="start"></button>' ..
    '</ui>')

end

function sysCall_sensing()
    -- put your sensing code here


end

function sysCall_cleanup()
    -- do some clean-up here
end

-- See the user manual or the available code snippets for additional callback functions and details
