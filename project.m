listing=dir('/home/aka/Ubuntu/Project/SMAI/actual/Font/*');
sz=size(listing);
sz=sz(1);
charit=[];
for i=3:12
    charit(i)=i-3
end
sit = upper('abcdefghijklmnopqrstuvwxyz');

for i=13:38
    charit(i)=sit(i-12);
end

sit=lower(sit);
for i=39:64
    charit(i)=sit(i-38);
end

mat=zeros(70,1200,10);
for i=3:64
    varit='/home/aka/Ubuntu/Project/SMAI/actual/Font/';
    varit=strcat(varit,listing(i).('name'));
    img=dir(varit);
    szit=size(img);
    szit=szit(1);
    %mat=zeros(szit,10);
    for j=3:szit
        imgname=strcat(varit,'/');
        imgname=strcat(imgname,img(j).('name'));
        
        %Calculate Invariant moments
        valit=feature_vec(imgname);
        doit=size(valit);
        doit=doit(1);
        p=valit';
        mat(i,j,1:7)=p;
        
        %Calculate Zenrik's code
        valit=Zernike_main(imgname);
        mat(i,j,8:9)=valit;
        mat(i,j,10)=charit(i-2);
        
    end
end