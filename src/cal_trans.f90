!
!
subroutine cal_trans

  use all_var

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  if(k_gradient .eq. 0)then
     goto 10
  else
     if(k_gradient .eq. 1)then
        goto 20
     else
        goto 30
     end if
  end if
  
  !
  !
10 continue
  
  pdd_sum=0.0d0
  do i=1,n_bin
     
     d_gradient=0.0d0
     do j=qv_range1,qv_range2
        d_gradient=d_gradient+bin_iv(i,j)*diff_iv(j)/(exp_iv_sigma(j)**2)
     end do

     if(pdd0(i) .ne. 0.0d0)then
        gradient(i)=conf_fac*(dlog(pdd1(i)/pdd0(i))+1.0d0)&
             &+2.0d0*d_gradient/n_qv_range
     else
        gradient(i)=2.0d0*d_gradient/n_qv_range
     end if
     
     pdd2(i)=pdd1(i)*dexp(-gradient(i)*trans_rate)
     pdd_sum=pdd_sum+pdd2(i)
     
  end do
  pdd2(1:n_bin)=pdd2(1:n_bin)/pdd_sum
  
  goto 100
  
  !
  !
20 continue
  
  pdd_sum=0.0d0
  do i=1,n_bin
     
     d_gradient=0.0d0
     do j=qv_range1,qv_range2
        d_gradient=d_gradient+bin_iv(i,j)*diff_iv(j)/(exp_iv_sigma(j)**2)
     end do
     
     if(pdd0(i) .ne. 0.0d0)then
        gradient(i)=conf_fac*(dlog(pdd1(i)/pdd0(i))+1.0d0)&
             &+2.0d0*d_gradient/n_qv_range
     else
        gradient(i)=2.0d0*d_gradient/n_qv_range
     end if
     
     pdd2(i)=pdd1(i)-gradient(i)*trans_rate
     
     if(pdd2(i) .lt. 0.0d0)then
        pdd2(i)=0.0d0
     else
        if(pdd2(i) .gt. 1.0d0)then
           pdd2(i)=1.0d0
        else
           continue
        end if
     end if
     pdd_sum=pdd_sum+pdd2(i)
     
  end do
  pdd2(1:n_bin)=pdd2(1:n_bin)/pdd_sum
  
  goto 100
  
  
  !
  !
30 continue
  
  pdd_sum=0.0d0
  do i=1,n_bin
     
     d_gradient=0.0d0
     do j=qv_range1,qv_range2
        d_gradient=d_gradient+bin_iv(i,j)*diff_iv(j)/(exp_iv_sigma(j)**2)
     end do
     
     if(pdd0(i) .ne. 0.0d0)then
        gradient(i)=pdd1(i)*(conf_fac*(dlog(pdd1(i)/pdd0(i))+1.0d0)&
             &+2.0d0*d_gradient/n_qv_range)
     else
        gradient(i)=pdd1(i)*2.0d0*d_gradient/n_qv_range
     end if
     
     pdd2(i)=pdd1(i)*dexp(-gradient(i)*trans_rate)
     pdd_sum=pdd_sum+pdd2(i)
     
  end do
  pdd2(1:n_bin)=pdd2(1:n_bin)/pdd_sum
  
  goto 100   

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
100 continue

  return
end subroutine cal_trans
