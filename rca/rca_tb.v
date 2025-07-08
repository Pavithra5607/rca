module tb_ripple_carry_adder;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    ripple_carry_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, tb_ripple_carry_adder);

        $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        a = 4'b0001; b = 4'b0001; cin = 1; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        $finish;
    end
endmodule