!
!
subroutine cal_score()
  
  use all_var

  !
  !
  kai2=0.0d0
  do i=qv_range1,qv_range2
     bin_iv_ave(i)=0.0d0
     do j=1,n_bin
        bin_iv_ave(i)=bin_iv_ave(i)+d_pdd(j)*bin_iv(j,i)
     end do
     diff_iv(i)=bin_iv_ave(i)-exp_iv(i)
     kai2=kai2+(diff_iv(i)/exp_iv_sigma(i))**2
  end do
  kai2=kai2/n_qv_range

  !
  !
  arep=0.0d0
  kld_fr0=0.0d0

  do i=1,n_bin
     
     if(true_pdd(i) .ne. 0.0d0)then
        arep=arep+dabs(d_pdd(i)-true_pdd(i))
     else
        continue
     end if

     if(pdd0(i).ne.0.0d0 .and. d_pdd(i).ne.0.0d0)then
        kld_fr0=kld_rf0+pdd0(i)*dlog(pdd0(i)/d_pdd(i))
     else
        continue
     end if

  end do

  !
  !
  return
end subroutine cal_score
