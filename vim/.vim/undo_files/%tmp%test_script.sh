Vim�UnDo� ����ұ��^���e/�x9�Ⱥ(��pi��                                     U���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             U��     �                   5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U��     �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U��     �          	      notify-send-all(){5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U���     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U���     �   
               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U���    �                 ,notify-send -u critical "Currently offline."5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             U��
     �                notify-send-all(){5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             U��     �                &    for p in $(pgrep gconf-helper); do5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             U��     �                g        dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$p/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//')5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             U��     �                D        user=$(grep -m 1 -z USER /proc/$p/environ | sed 's/USER=//')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U��     �                E        dply=$(grep -z DISPLAY /proc/$p/environ | sed 's/DISPLAY=//')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U��     �                a        sudo -u $user sh -c "DBUS_SESSION_BUS_ADDRESS=\"$dbus\" DISPLAY=\"$dply\" notify-send $@"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U��     �                    done5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U��     �                }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U��     �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U��    �               'export XAUTHORITY=/home/dan/.Xauthority5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             U��;     �                 0notify-send-all -u critical "Currently offline."5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U��@    �                 ,notify-send -u critical "Currently offline."5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U���     �                 5/usr/bin/notify-send -u critical "Currently offline."5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U���     �                5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             U���    �                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             U��     �                 �             	   tify-send-all(){   &    for p in $(pgrep gconf-helper); do   g        dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$p/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//')   D        user=$(grep -m 1 -z USER /proc/$p/environ | sed 's/USER=//')   E        dply=$(grep -z DISPLAY /proc/$p/environ | sed 's/DISPLAY=//')   a        sudo -u $user sh -c "DBUS_SESSION_BUS_ADDRESS=\"$dbus\" DISPLAY=\"$dply\" notify-send $@"       done   }   
uuuuuuuuuu5��