<TeXmacs|1.99.18>

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
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      kill(all)$

      declare(p, scalar)$

      declare(u, scalar)$

      declare(t, scalar)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
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
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      f : [

      \ \ \ \ p[1] - u[2],

      \ \ \ \ u[3] + p[2],

      \ \ \ \ u[1] * u[2] - u[3]

      ]$

      h : u[1]$

      n : length(f)$

      order : n$

      Om : obs_map(order, h, f);

      eqs : [z[1] = Om[1][1], z[2] = Om[2][1],

      \ \ \ \ \ \ \ z[3] = Om[3][1]

      ]$

      sol : solve(eqs, [u[1], u[2], u[3]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|p<rsub|1>-u<rsub|2>>>|<row|<cell|-u<rsub|3>-p<rsub|2>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|u<rsub|1>=z<rsub|1>,u<rsub|2>=p<rsub|1>-z<rsub|2>,u<rsub|3>=-z<rsub|3>-p<rsub|2>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
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
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      ratsimp(subst(sol, vector_jacobian(Om, [u[1], u[2], u[3]]) . f));

      sol
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|z<rsub|2>>>|<row|<cell|z<rsub|3>>>|<row|<cell|-z<rsub|3>+z<rsub|1>*z<rsub|2>-p<rsub|2>-p<rsub|1>*z<rsub|1>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|u<rsub|1>=z<rsub|1>,u<rsub|2>=p<rsub|1>-z<rsub|2>,u<rsub|3>=-z<rsub|3>-p<rsub|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      order : 4$

      Om : obs_map(order, h, f);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|p<rsub|1>-u<rsub|2>>>|<row|<cell|-u<rsub|3>-p<rsub|2>>>|<row|<cell|u<rsub|3>-u<rsub|1>*u<rsub|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>