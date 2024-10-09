!
! Allocation of variables
!
subroutine allocate_var()

  use all_var

  !
  !
  dacos_pi=-1.0d0
  pi=dacos(dacos_pi)

  n_qv_range=qv_range2-qv_range1+1

  write(21,'(a,i5)')'qv_range1  = ',qv_range1
  write(21,'(a,i5)')'qv_range2  = ',qv_range2
  write(21,'(a,i5)')'n_qv_range = ',n_qv_range


  !
  !
  allocate (&
       &bin_data(n_bin),&
       &d_pdd(n_bin),&
       &pdd0(n_bin),&
       &pdd1(n_bin),&
       &pdd2(n_bin),&
       &true_pdd(n_bin),&
       &gradient(n_bin),&
       &stat=allocate_err)

  allocate (&
       &qv(n_qv),&
       &exp_iv(n_qv),&
       &exp_iv_sigma(n_qv),&
       &bin_iv(n_bin,n_qv),&
       &bin_iv_ave(n_qv),&
       &bin_iv_ave_old(n_qv),&
       &diff_iv(n_qv),&
       &stat=allocate_err)

  !
  !
  return
end subroutine allocate_var
