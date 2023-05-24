// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// Generated by Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition
// Created on Sat May 20 11:27:35 2023

// synthesis message_off 10175

`timescale 1ns/1ns

module Sensor_MovimentoV2 (
    reset,clock,ACT,EN,
    SA0,SA1,SA2);

    input reset;
    input clock;
    input ACT;
    input EN;
    tri0 reset;
    tri0 ACT;
    tri0 EN;
    output SA0;
    output SA1;
    output SA2;
    reg SA0;
    reg SA1;
    reg SA2;
    reg [5:0] fstate;
    reg [5:0] reg_fstate;
    parameter B=0,T=1,A1=2,A2=3,A3=4,A4=5;

    always @(posedge clock)
    begin
        if (clock) begin
            fstate <= reg_fstate;
        end
    end

    always @(fstate or reset or ACT or EN)
    begin
        if (reset) begin
            reg_fstate <= B;
            SA0 <= 1'b0;
            SA1 <= 1'b0;
            SA2 <= 1'b0;
        end
        else begin
            SA0 <= 1'b0;
            SA1 <= 1'b0;
            SA2 <= 1'b0;
            case (fstate)
                B: begin
                    if ((EN == 1'b1))
                        reg_fstate <= T;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= B;

                    SA1 <= 1'b0;

                    SA2 <= 1'b0;

                    SA0 <= 1'b0;
                end
                T: begin
                    if (((EN == 1'b1) & (ACT == 1'b1)))
                        reg_fstate <= A1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= T;

                    SA1 <= 1'b0;

                    SA2 <= 1'b0;

                    SA0 <= 1'b1;
                end
                A1: begin
                    if (((EN == 1'b1) & (ACT == 1'b1)))
                        reg_fstate <= A2;
                    else if (((EN == 1'b1) & (ACT == 1'b0)))
                        reg_fstate <= T;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= A1;

                    SA1 <= 1'b1;

                    SA2 <= 1'b0;

                    SA0 <= 1'b0;
                end
                A2: begin
                    if (((EN == 1'b1) & (ACT == 1'b1)))
                        reg_fstate <= A3;
                    else if (((EN == 1'b1) & (ACT == 1'b0)))
                        reg_fstate <= A1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= A2;

                    SA1 <= 1'b1;

                    SA2 <= 1'b0;

                    SA0 <= 1'b1;
                end
                A3: begin
                    if (((EN == 1'b1) & (ACT == 1'b0)))
                        reg_fstate <= A2;
                    else if (((EN == 1'b1) & (ACT == 1'b1)))
                        reg_fstate <= A4;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= A3;

                    SA1 <= 1'b0;

                    SA2 <= 1'b1;

                    SA0 <= 1'b0;
                end
                A4: begin
                    if (((EN == 1'b1) & (ACT == 1'b0)))
                        reg_fstate <= A3;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= A4;

                    SA1 <= 1'b0;

                    SA2 <= 1'b1;

                    SA0 <= 1'b1;
                end
                default: begin
                    SA0 <= 1'bx;
                    SA1 <= 1'bx;
                    SA2 <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
        end
    end
endmodule // Sensor_MovimentoV2
