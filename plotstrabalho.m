     figure
    hold on
    plot(x)
    plot(y)
    legend('Sinal x', 'Sinal y')
    xlabel('Amostras')
    ylabel('Amplitude')
    title('Sinal x e Sinal y')
    
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
        if (r2 == 20)||(r2 == 30)||(r2 == 40)||(r2 == 50)
            figure;
            plot(x);hold on;
            plot(real(hat_xcan_r),'--o');
            legend('Real', 'Estimado')
            title(['Posto = ' num2str(r2) ', MSE = ' num2str(e_teste(ind, r2))]);
             xlabel('Amostras')
            ylabel('Amplitude')
        end
 end
    
 figure
plot((mean(e_teste,1)));
xlim([2 r2])