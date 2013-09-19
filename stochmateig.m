% http://www.mathworks.com/matlabcentral/fileexchange/9700-random-vectors-with-fixed-sum
%function [] = stochmateig(N,dim,colsum,elmin,elmax)

%% Initialize parameters (uncomment to run as script)

N=100000;
dim=3;
colsum = 1;
elmin=0;
elmax=1;

%%
ss=zeros(dim,dim,N);
eV=zeros(dim,N);

for i=1:N
    ss(:,:,i)=randfixedsum(dim,dim,colsum,elmin,elmax);
    [V D]=eig(ss(:,:,i));
    eV(:,i) = V(:,1);
end

% Settings
%-------------------------------
set(0,'defaultaxesfontsize',20);
set(0,'defaulttextfontsize',20);
scrsz = get(0,'ScreenSize');
%-------------------------------

% Plot data
%-------------------------------
%if opensavefigFlag
%    h=figure('Visible','off','Position',[0 0 scrsz(3)/4.5 scrsz(4)/1.4]); set(h,'Color','w');
%else
    h=figure('Position',[0 0 scrsz(3)/4.5 scrsz(4)/1.4]); set(h,'Color','w');

scatter3(eV(1,:)',eV(2,:)',eV(3,:)',5,'r');
%plot3(eV(1,:)',eV(2,:)',eV(3,:)');