<TeXmacs|2.1.1>

<style|<tuple|generic|maxima>>

<\body>
  \;

  <\session|maxima|default>
    <\output>
      \;

      Maxima 5.43.2 http://maxima.sourceforge.net

      using Lisp GNU Common Lisp (GCL) GCL 2.6.12

      Distributed under the GNU Public License. See the file COPYING.

      Dedicated to the memory of William Schelter.

      The function bug_report() provides bug reporting information.
    </output>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>81) >
    <|input>
      kill(all)$

      declare(p, scalar)$

      declare(u, scalar)$

      declare(t, scalar)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      A : matrix([0, 1], [-omega^2, 0]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>>|<row|<cell|-\<omega\><rsup|2>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      Aodd(i) := matrix([0, (-1)^((i - 1)/2)*omega^(i-1)],
      [(-1)^((i+1)/2)*omega^(i+1), 0])$

      Aodd(1) = A^^1;

      Aodd(3) = A^^3;

      Aodd(5) = A^^5;

      Aodd(7) = A^^7;

      Aodd(9) = A^^9;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>>|<row|<cell|-\<omega\><rsup|2>>|<cell|0>>>>>=<matrix|<tformat|<table|<row|<cell|0>|<cell|1>>|<row|<cell|-\<omega\><rsup|2>>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-\<omega\><rsup|2>>>|<row|<cell|\<omega\><rsup|4>>|<cell|0>>>>>=<matrix|<tformat|<table|<row|<cell|0>|<cell|-\<omega\><rsup|2>>>|<row|<cell|\<omega\><rsup|4>>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|\<omega\><rsup|4>>>|<row|<cell|-\<omega\><rsup|6>>|<cell|0>>>>>=<matrix|<tformat|<table|<row|<cell|0>|<cell|\<omega\><rsup|4>>>|<row|<cell|-\<omega\><rsup|6>>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-\<omega\><rsup|6>>>|<row|<cell|\<omega\><rsup|8>>|<cell|0>>>>>=<matrix|<tformat|<table|<row|<cell|0>|<cell|-\<omega\><rsup|6>>>|<row|<cell|\<omega\><rsup|8>>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|\<omega\><rsup|8>>>|<row|<cell|-\<omega\><rsup|10>>|<cell|0>>>>>=<matrix|<tformat|<table|<row|<cell|0>|<cell|\<omega\><rsup|8>>>|<row|<cell|-\<omega\><rsup|10>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      Aeven(i) := matrix([(-1)^(i/2)*omega^(i), 0], [0,
      (-1)^(i/2)*omega^(i)])$

      Aeven(2) = A^^2;

      Aeven(4) = A^^4;

      Aeven(6) = A^^6;

      Aeven(8) = A^^8;

      Aeven(10) = A^^10;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|-\<omega\><rsup|2>>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsup|2>>>>>>=<matrix|<tformat|<table|<row|<cell|-\<omega\><rsup|2>>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsup|2>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|\<omega\><rsup|4>>|<cell|0>>|<row|<cell|0>|<cell|\<omega\><rsup|4>>>>>>=<matrix|<tformat|<table|<row|<cell|\<omega\><rsup|4>>|<cell|0>>|<row|<cell|0>|<cell|\<omega\><rsup|4>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|-\<omega\><rsup|6>>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsup|6>>>>>>=<matrix|<tformat|<table|<row|<cell|-\<omega\><rsup|6>>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsup|6>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|\<omega\><rsup|8>>|<cell|0>>|<row|<cell|0>|<cell|\<omega\><rsup|8>>>>>>=<matrix|<tformat|<table|<row|<cell|\<omega\><rsup|8>>|<cell|0>>|<row|<cell|0>|<cell|\<omega\><rsup|8>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|-\<omega\><rsup|10>>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsup|10>>>>>>=<matrix|<tformat|<table|<row|<cell|-\<omega\><rsup|10>>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsup|10>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      C : matrix([1, 0, 1, 0, 1]);

      A(omega) := matrix([0, 1], [-omega^2, 0]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|1>|<cell|0>|<cell|1>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>A<around*|(|\<omega\>|)>\<assign\><matrix|<tformat|<table|<row|<cell|0>|<cell|1>>|<row|<cell|-\<omega\><rsup|2>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      row1 : addcol(matrix(A(omega[1])[1]), [0, 0, 0])$

      row2 : addcol(matrix(A(omega[1])[2]), [0, 0, 0])$

      row3 : addcol(matrix([0, 0]), A(omega[2])[1], [0])$

      row4 : addcol(matrix([0, 0]), A(omega[2])[2], [0])$

      row5 : [0, 0, 0, 0, 0]$

      barA : addrow(row1, row2, row3, row4, row5);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|-\<omega\><rsub|1><rsup|2>>|<cell|0>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-\<omega\><rsub|2><rsup|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>61) >
    <|unfolded-io>
      O : addrow(C,

      \ \ \ \ \ \ \ C . barA,

      \ \ \ \ \ \ \ C . barA^^2,

      \ \ \ \ \ \ \ C . barA^^3,

      \ \ \ \ \ \ \ C . barA^^4);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o61>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|1>|<cell|0>|<cell|1>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-\<omega\><rsub|1><rsup|2>>|<cell|0>|<cell|-\<omega\><rsub|2><rsup|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|-\<omega\><rsub|1><rsup|2>>|<cell|0>|<cell|-\<omega\><rsub|2><rsup|2>>|<cell|0>>|<row|<cell|\<omega\><rsub|1><rsup|4>>|<cell|0>|<cell|\<omega\><rsub|2><rsup|4>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>64) >
    <|unfolded-io>
      ratsimp(invert(O))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o64>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-<frac|\<omega\><rsub|2><rsup|2>|\<omega\><rsub|1><rsup|2>*\<omega\><rsub|2><rsup|2>-\<omega\><rsub|1><rsup|4>>>|<cell|0>|<cell|-<frac|1|\<omega\><rsub|1><rsup|2>*\<omega\><rsub|2><rsup|2>-\<omega\><rsub|1><rsup|4>>>>|<row|<cell|0>|<cell|<frac|\<omega\><rsub|2><rsup|2>|\<omega\><rsub|2><rsup|2>-\<omega\><rsub|1><rsup|2>>>|<cell|0>|<cell|<frac|1|\<omega\><rsub|2><rsup|2>-\<omega\><rsub|1><rsup|2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|\<omega\><rsub|1><rsup|2>|\<omega\><rsub|2><rsup|4>-\<omega\><rsub|1><rsup|2>*\<omega\><rsub|2><rsup|2>>>|<cell|0>|<cell|<frac|1|\<omega\><rsub|2><rsup|4>-\<omega\><rsub|1><rsup|2>*\<omega\><rsub|2><rsup|2>>>>|<row|<cell|0>|<cell|-<frac|\<omega\><rsub|1><rsup|2>|\<omega\><rsub|2><rsup|2>-\<omega\><rsub|1><rsup|2>>>|<cell|0>|<cell|-<frac|1|\<omega\><rsub|2><rsup|2>-\<omega\><rsub|1><rsup|2>>>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|<frac|\<omega\><rsub|2><rsup|2>+\<omega\><rsub|1><rsup|2>|\<omega\><rsub|1><rsup|2>*\<omega\><rsub|2><rsup|2>>>|<cell|0>|<cell|<frac|1|\<omega\><rsub|1><rsup|2>*\<omega\><rsub|2><rsup|2>>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|input>
      Lfh(h, f) := block (

      \ \ \ \ tmp : zeromatrix(n, 1),

      \ \ \ \ for i: 1 thru n do (

      \ \ \ \ \ \ \ \ tmp[i] : diff(h, u[i])

      \ \ \ \ ),

      \ \ \ \ transpose(tmp) . f

      )$

      obs_map(order, h, f) := block (

      \ \ \ O : zeromatrix(order, 1),

      \ \ \ tmp : h,

      \ \ \ for i: 1 thru order do (

      \ \ \ \ \ \ O[i] : [tmp],

      \ \ \ \ \ \ tmp : Lfh([tmp], f)

      \ \ \ ),

      \ \ \ O

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      f : [

      \ \ u[2],

      \ \ -w[1]^2 * u[1],

      \ \ u[4],

      \ \ -w[2]^2 * u[3],

      \ \ 0

      ]$

      h : u[1] + u[3] + u[5]$

      n : length(f)$

      order : n$

      Om : obs_map(order, h, f);

      eqs : [z[1] = Om[1][1], z[2] = Om[2][1],

      \ \ \ \ \ \ \ z[3] = Om[3][1], z[4] = Om[4][1], z[5] = Om[5][1]

      ]$

      sol : solve(eqs, [u[1], u[2], u[3], u[4], u[5]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|5>+u<rsub|3>+u<rsub|1>>>|<row|<cell|u<rsub|4>+u<rsub|2>>>|<row|<cell|-w<rsub|2><rsup|2>*u<rsub|3>-u<rsub|1>*w<rsub|1><rsup|2>>>|<row|<cell|-w<rsub|2><rsup|2>*u<rsub|4>-w<rsub|1><rsup|2>*u<rsub|2>>>|<row|<cell|w<rsub|2><rsup|4>*u<rsub|3>+u<rsub|1>*w<rsub|1><rsup|4>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><around*|[|u<rsub|1>=-<frac|z<rsub|5>+w<rsub|2><rsup|2>*z<rsub|3>|w<rsub|1><rsup|2>*w<rsub|2><rsup|2>-w<rsub|1><rsup|4>>,u<rsub|2>=<frac|z<rsub|4>+w<rsub|2><rsup|2>*z<rsub|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|3>=<frac|z<rsub|5>+w<rsub|1><rsup|2>*z<rsub|3>|w<rsub|2><rsup|4>-w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>,u<rsub|4>=-<frac|z<rsub|4>+w<rsub|1><rsup|2>*z<rsub|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|5>=<frac|z<rsub|5>+<around*|(|w<rsub|2><rsup|2>+w<rsub|1><rsup|2>|)>*z<rsub|3>+w<rsub|1><rsup|2>*z<rsub|1>*w<rsub|2><rsup|2>|w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|input>
      vector_jacobian(M, var) := block (

      \ \ \ \ [n, m, l, i, k, J],

      \;

      \ \ \ \ J : 0,

      \;

      \ \ \ \ n : length(M),

      \ \ \ \ l : length(var),

      \;

      \ \ \ \ J : zeromatrix(n, l),

      \;

      \ \ \ \ for i: 1 thru n do (

      \ \ \ \ \ \ \ \ for k: 1 thru l do (

      \ \ \ \ \ \ \ \ \ \ \ \ J[i][k] : diff(M[i], var[k]),

      \ \ \ \ \ \ \ \ \ \ \ \ if (scalarp(J[i][k]) = false) then J[i][k] :
      J[i][k][1]

      \ \ \ \ \ \ \ \ )

      \ \ \ \ ),

      \ \ \ \ J

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>56) >
    <|unfolded-io>
      ratsimp(subst(sol, vector_jacobian(Om, [u[1], u[2], u[3], u[4], u[5]])
      . f));

      sol
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o56>)
      >><matrix|<tformat|<table|<row|<cell|z<rsub|2>>>|<row|<cell|z<rsub|3>>>|<row|<cell|z<rsub|4>>>|<row|<cell|z<rsub|5>>>|<row|<cell|<around*|(|-w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*z<rsub|4>-w<rsub|1><rsup|2>*w<rsub|2><rsup|2>*z<rsub|2>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o57>)
      >><around*|[|u<rsub|1>=-<frac|z<rsub|5>+w<rsub|2><rsup|2>*z<rsub|3>|w<rsub|1><rsup|2>*w<rsub|2><rsup|2>-w<rsub|1><rsup|4>>,u<rsub|2>=<frac|z<rsub|4>+w<rsub|2><rsup|2>*z<rsub|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|3>=<frac|z<rsub|5>+w<rsub|1><rsup|2>*z<rsub|3>|w<rsub|2><rsup|4>-w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>,u<rsub|4>=-<frac|z<rsub|4>+w<rsub|1><rsup|2>*z<rsub|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|5>=<frac|z<rsub|5>+<around*|(|w<rsub|2><rsup|2>+w<rsub|1><rsup|2>|)>*z<rsub|3>+w<rsub|1><rsup|2>*z<rsub|1>*w<rsub|2><rsup|2>|w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>|]>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>