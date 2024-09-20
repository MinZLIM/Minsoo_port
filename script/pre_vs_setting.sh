echo 'HOW to use
input interface1 name: ex)eth2
input interface2 name: ex)eth3
input interface1 Network: ex) 2.2
 >> m2mac1 > 2.2.1.126/25
 >> m3mac1 > 2.2.1.254/25'
echo '------------------------------------'
echo 'input interface1 name:'
read int1
echo 'input interface2 name:'
read int2
echo 'input macvlan network'
read net

echo '------------------------------------'


echo $int1
echo $int2
## 플랫폼 메모리 별 생성한 vs 개수 정의
mem=$(cli get_platform |awk {'print$5'})
if [ $mem -eq 4 ] ; then
    mem=5
elif [ $mem -eq 8 ] ; then
    mem=10
elif [ $mem -eq 16 ] ; then
    mem=20
elif [ $mem -ge 24 ] ; then
    mem=255
fi

## macvlan 설정 수행
for i in $(seq 1 $mem)
do
    cli add_nif "n${int1}mac${i}" "13" "${net}.$i.126" "25" "1" "1500" "1" "1" "1" "1" "" "$int1"
    cli add_nif "n${int2}mac${i}" "13" "${net}.$i.254" "25" "1" "1500" "1" "1" "1" "1" "" "$int2"
done

## vs 개수 별 가상시스템 관리자 생성
for i in $(seq 1 $mem)
do
cli add_admuser "vsadmin$i" "1q2w3e!@#" "0" "" "1" "0" "" "50" "" "3" "5" "" "" "" "" "0" "" "" "" "" "0" "0" "0" "0" "0" "" "0" "" "" ""
done


## 가상시스템 리소스 할당하여 생성
for i  in {1..42}
do
    test_array[$i]=$(cli check_vs_resource | awk '{print $'$i'}')
    test_array[$i]=$(( ${test_array[$i]} / $mem ))
    echo "${test_array[$i]}"
done

if [ $mem -le 20 ] ; then
    for x in $(seq 1 $mem)
    do
        if [ $x -lt $((mem/2)) ]; then
            cli add_vs "virtsys$x" "1" "n${int1}mac$x;n${int2}mac$x" "vsadmin$x" "" "${test_array[1]}" "${test_array[2]}" "${test_array[3]}" "${test_array[4]}" "${test_array[5]}" "${test_array[6]}" "${test_array[7]}" "${test_array[8]}" "${test_array[9]}" "${test_array[10]}" "${test_array[11]}" "${test_array[12]}" "${test_array[13]}" "${test_array[14]}" "${test_array[15]}" "${test_array[16]}" "${test_array[17]}" "${test_array[18]}" "${test_array[19]}" "${test_array[20]}" "${test_array[21]}" "${test_array[22]}" "${test_array[23]}" "${test_array[24]}" "${test_array[25]}" "${test_array[26]}" "${test_array[27]}" "${test_array[28]}" "${test_array[29]}" "${test_array[30]}" "${test_array[31]}" "1" "128" "1" "8" "128" "8" "11" "11" "11" "11" "${test_array[42]}"
        else
            cli add_vs "virtsys$x" "1" "n${int1}mac$x;n${int2}mac$x" "vsadmin$x" "" "${test_array[1]}" "${test_array[2]}" "${test_array[3]}" "${test_array[4]}" "${test_array[5]}" "${test_array[6]}" "${test_array[7]}" "${test_array[8]}" "${test_array[9]}" "${test_array[10]}" "${test_array[11]}" "${test_array[12]}" "${test_array[13]}" "${test_array[14]}" "${test_array[15]}" "${test_array[16]}" "${test_array[17]}" "${test_array[18]}" "${test_array[19]}" "${test_array[20]}" "${test_array[21]}" "${test_array[22]}" "${test_array[23]}" "${test_array[24]}" "${test_array[25]}" "${test_array[26]}" "${test_array[27]}" "${test_array[28]}" "${test_array[29]}" "${test_array[30]}" "${test_array[31]}" "0" "0" "0" "0" "0" "0" "10" "10" "10" "10" "${test_array[42]}"
        fi
    done
else
    for x in $(seq 1 $mem)
    do
        if [ $x -lt 32 ]; then
            cli add_vs "virtsys$x" "1" "n${int1}mac$x;n${int2}mac$x" "vsadmin$x" "" "${test_array[1]}" "${test_array[2]}" "${test_array[3]}" "${test_array[4]}" "${test_array[5]}" "${test_array[6]}" "${test_array[7]}" "${test_array[8]}" "${test_array[9]}" "${test_array[10]}" "${test_array[11]}" "${test_array[12]}" "${test_array[13]}" "${test_array[14]}" "${test_array[15]}" "${test_array[16]}" "${test_array[17]}" "${test_array[18]}" "${test_array[19]}" "${test_array[20]}" "${test_array[21]}" "${test_array[22]}" "${test_array[23]}" "${test_array[24]}" "${test_array[25]}" "${test_array[26]}" "${test_array[27]}" "${test_array[28]}" "${test_array[29]}" "${test_array[30]}" "${test_array[31]}" "1" "128" "1" "8" "128" "8" "11" "11" "11" "11" "${test_array[42]}"
        else
            cli add_vs "virtsys$x" "1" "n${int1}mac$x;n${int2}mac$x" "vsadmin$x" "" "${test_array[1]}" "${test_array[2]}" "${test_array[3]}" "${test_array[4]}" "${test_array[5]}" "${test_array[6]}" "${test_array[7]}" "${test_array[8]}" "${test_array[9]}" "${test_array[10]}" "${test_array[11]}" "${test_array[12]}" "${test_array[13]}" "${test_array[14]}" "${test_array[15]}" "${test_array[16]}" "${test_array[17]}" "${test_array[18]}" "${test_array[19]}" "${test_array[20]}" "${test_array[21]}" "${test_array[22]}" "${test_array[23]}" "${test_array[24]}" "${test_array[25]}" "${test_array[26]}" "${test_array[27]}" "${test_array[28]}" "${test_array[29]}" "${test_array[30]}" "${test_array[31]}" "0" "0" "0" "0" "0" "0" "10" "10" "10" "10" "${test_array[42]}"
        fi
    done
fi
