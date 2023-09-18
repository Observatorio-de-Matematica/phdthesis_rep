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
      <with|color|red|(<with|math-font-family|rm|%i>1) >
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
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      f : [

      \ \ u[2]-u[1],

      \ \ -u[1] * u[3],

      \ \ u[1] * u[1] + p

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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>-u<rsub|1>>>|<row|<cell|-u<rsub|1>*u<rsub|3>-u<rsub|2>+u<rsub|1>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
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
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      ratsimp(subst(sol, vector_jacobian(Om, [u[1], u[2], u[3]]) . f));

      sol
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|z<rsub|2>>>|<row|<cell|z<rsub|3>>>|<row|<cell|-<frac|z<rsub|1><rsup|2>*p+<around*|(|z<rsub|1>-z<rsub|2>|)>*z<rsub|3>-z<rsub|2><rsup|2>+z<rsub|1><rsup|4>|z<rsub|1>>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|u<rsub|1>=z<rsub|1>,u<rsub|2>=z<rsub|2>+z<rsub|1>,u<rsub|3>=-<frac|z<rsub|3>+z<rsub|2>|z<rsub|1>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
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