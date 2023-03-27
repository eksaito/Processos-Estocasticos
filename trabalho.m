clear;clc;close all
n = 100;
for ind = 1:1
    %     fs=10; %Hz
    %     x = randn(n,1);
    % y(1) = x(1);
    %
    % for ind = 2:n
    % y(ind,1) = 0.5*y(ind-1) + x(ind);
    % end
    %     x = sin([1:n]*1/fs)' + 0.2*randn(n,1);
    
    ruido = 0.1*randn(n,1);
    x = randn(n,1) + ruido;
    b = 1;
    a = [1 0.5];
    y = filter (b, a, x) + 0.1*randn(n,1) + ruido;
    
    %     y = x + 0.2*randn(n,1);
    %     y = y(end-n2+1:end);
    %     x = x(end-n2+1:end);
    
    x = (x - mean(x))/sqrt(var(x));
    y = (y - mean(y))/sqrt(var(y));
    
    Rxx = x*x'/n;
    Ryy = y*y'/n;
    Ryx = y*x'/n;
    Rxy = x*y'/n;
    %     figure
    %     hold on
    %     plot(x)
    %     plot(y)
    %% Coordenadas Padrão
    W =  Rxy*pinv(Ryy);
    Q = Rxx - Rxy*pinv(Ryy)*Rxy';
    [~,~,~,~,Kyy] = gsvd(Ryy,Ryy);
    K1yy(:,ind) = diag(Kyy);
    
    hat_x = W*y;
    hat_e = x - hat_x;
    
    e_norma(ind) = norm(hat_e);
    trQ(ind) = trace(Q);
    
    % plot(x); hold on; stem(hat_x)
    [UU,SS,VV] = svd(Ryy);
    Syy(:,ind) = diag(SS);
    %% Coordenadas de Coerência
    Cxy = pinv(Rxx)^(1/2) * Rxy * transpose(pinv(Ryy)^(1/2));
    
    Wcoh = Rxx^(1/2) * Cxy * pinv(Ryy)^(1/2);
    Qcoh = Rxx^(1/2)*(eye(length(Cxy)) - Cxy*Cxy')*(Rxx^(1/2))';
    
    hat_xcoh = Wcoh*y;
    hat_ecoh = x - hat_xcoh;
    
    ecoh_norma(ind) = norm(hat_ecoh);
    trQcoh(ind) = real(trace(Qcoh));
    
    %     figure;plot(x);hold on;stem(real(hat_xcoh))
    %% Coordenadas Canônicas
    [~,F,G,~,K] = gsvd(Cxy,Cxy);
    K1(:,ind) = diag(K);
    
    A = F*K*G';
    Wcan = Rxx^(1/2)*A*pinv(Ryy)^(1/2);
    Qcan = Rxx^(1/2)*F*(eye(length(K))-K*K')*F'*(Rxx^(1/2))';
    
    hat_xcan = Wcan*y;
    hat_ecan = x - hat_xcan;
    
    ecan_norma(ind) = norm(hat_ecan);
    trQcan(ind) = real(trace(Qcan));
    %     figure;plot(x);hold on;stem(real(hat_xcan))
    %% Coordenadas Canonicas Reduzidas
    for r2 = 2:1:n
        
        Kr = K;
        Kr(r2:end,r2:end) = 0;
        Ar = F*Kr*G';
        
        Wcan_r = Rxx^(1/2) * Ar * pinv(Ryy)^(1/2);
        Qcan_r = Rxx^(1/2)*F*(eye(length(Kr))-Kr*Kr')*F'*(Rxx^(1/2))';
        
        hat_xcan_r = Wcan_r*y;
        hat_ecan_r = x - hat_xcan_r;
        
        ecan_norma_r(ind, r2) = norm(hat_ecan_r);
        
        e_teste(ind, r2) = (hat_ecan_r'*hat_ecan_r)/n;
        
        trQcan_r(ind, r2) = real(trace(Qcan_r));
        %         if (r2 == 5)||(r2 == 25)||(r2 == 50)||(r2 == 100)
        %             figure;
        %             plot(x);hold on;
        %             plot(real(hat_xcan_r),'--o');
        %             legend('Real', 'Estimado')
        %             title(['Posto = ' num2str(r2) ', MSE = ' num2str(e_teste(ind, r2))]);
        %         end
    end
    
end
%%
% figure
% stem(K1)

% e_norma_r = mean(ecan_norma_r,1);
% figure
% plot(e_norma_r(1,:))
% xlim([2 r2])

figure
plot((mean(e_teste,1)));
xlim([2 n])
xlabel('Posto')
ylabel('MSE')
title('MSE x Posto')


% aux = ecan_norma_r;
% aux(aux==0) =[];
% aux2 = [10:10:50];
% auxt = [aux2',aux' ]