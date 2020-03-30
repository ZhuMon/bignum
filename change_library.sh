lib_in_user=('stdio.h' 'stdlib.h' 'string.h' 'stdint.h' 'ctype.h')
lib_in_kern=('linux\/kernel.h' 'linux\/slab.h' 'linux\/string.h' 'linux\/types.h' 'linux\/ctype.h')

for (( i=0; i<${#lib_in_user[*]}; i=i+1 ))
do
    files=(`grep "${lib_in_user[$i]}" *.[ch] | cut -d':' -f1`)
    for file in ${files[*]}
    do
        sed -i -e "s/${lib_in_user[$i]}/${lib_in_kern[$i]}/" ${file}
    done 
done

