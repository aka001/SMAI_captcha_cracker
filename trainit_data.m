listing=dir('/home/aka/Ubuntu/Project/SMAI/actual/Font/*');
sz=size(listing);
sz=sz(1);
charit=[];
for i=3:12
    charit(i)=i-3;
end
sit = upper('abcdefghijklmnopqrstuvwxyz');

for i=13:38
    charit(i)=sit(i-12);
end

sit=lower(sit);
for i=39:64
    charit(i)=sit(i-38);
end

mat=zeros(70*1200,9);
cnt=1;
chit=zeros(70*1500,1);
for i=3:64
    varit='/home/aka/Ubuntu/Project/SMAI/actual/Font/';
    varit=strcat(varit,listing(i).('name'));
    img=dir(varit);
    szit=size(img);
    szit=szit(1);
    %mat=zeros(szit,10);
    szit=szit/15;
    for j=3:szit
        imgname=strcat(varit,'/');
        imgname=strcat(imgname,img(j).('name'));
        
        %Calculate Invariant moments
        valit=feature_vec(imgname);
        doit=size(valit);
        doit=doit(1);
        p=valit';
        mat(cnt,1:7)=p;
        
        %Calculate Zenrik's code
        valit=Zernike_main(imgname);
        mat(cnt,8:9)=valit;
        chit(cnt,1)=charit(i);
        cnt=cnt+1;
    end
end

cnt=cnt-1;
mat=mat(1:cnt,1:9);
chit=chit(1:cnt);
%modelit=multisvm_train(mat,chit);

dlmwrite('matit.txt',mat);
dlmwrite('chit.txt',chit);