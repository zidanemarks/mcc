bit read_sequence_start = 0;
bit read_sequence_end = 0;

bit current_cmd_slc;
bit [1:0] current_cmd_mplane;
bit [11:0] current_page_address;
bit [1:0]  current_plane_address;

  if (nfi_cmd.mplane == 0) begin 
    // no multiplane
    if (nfi_cmd.slc != current_cmd_slc) begin
       send_4K_read(nfi_cmd); //00-30 -> RS -> 05-e0 
       return(0);
    end 
    if (nfi_cmd.mplane != current_cmd_mplane) begin
       send_4K_read(nfi_cmd); //00-30 -> RS -> 05-e0 
       return(0);
    end
    if (nfi_cmd.page != current_cmd_page) begin
       send_4K_read(nfi_cmd); //00-30 -> RS -> 05-e0 
       break;
    end
    if (nfi_cmd.sector == current_cmd_sector+1) begin
        // read back data
        send_read_continue();
    end else begin
        // 05 -E0
        send_read_data(nfi_cmd);
    end
  end else begin
    // multiplane
    // check next command
    mplane = 0
    if (nfi_cmd.mplane == 2) begin
      next_cmd == nfi_cmd++;
      if (nfi_cmd.page != next_cmd.page) begin
         // this command is wrong
         return(1);
      end 
      // same page, check plane
      if (nfi_cmd.mplane != mplane+1) begin
         // this command is wrong
         return(1);
      end 
      send_mp_1st_cmd(nfi_cmd); // 00-32
      send_mp_last_cmd(nfi_cmd); // 00-30 -> RS -> Read data back
    end else if (nfi_cmd.mplane == 4) begin
//      next_cmd == nfi_cmd+1;
//      if (nfi_cmd.page != next_cmd.page) begin
//         // this command is wrong
//         return(1);
//      end
//       // same page, check plane
//       mplane++;
//       if (nfi_cmd.mplane != mplane) begin
//          // this command is wrong
//          return(1);
//       end 
//       next_cmd = nfi_cmd+2;
//      if (nfi_cmd.page != next_cmd.page) begin
//         // this command is wrong
//         return(1);
//      end
//       // same page, check plane
//       mplane++;
//       if (nfi_cmd.mplane != mplane) begin
//          // this command is wrong
//          return(1);
//       end 
//       next_cmd = nfi_cmd+3;
//      if (nfi_cmd.page != next_cmd.page) begin
//         // this command is wrong
//         return(1);
//      end
//       // same page, check plane
//       mplane++;
//       if (nfi_cmd.mplane != mplane) begin
//          // this command is wrong
//          return(1);
//       end 
//       // multiplane 4
//       send_mp4_read();
    end
  end

