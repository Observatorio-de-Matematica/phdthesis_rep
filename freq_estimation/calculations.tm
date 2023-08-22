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
      <with|color|red|(<with|math-font-family|rm|%i>57) >
    <|unfolded-io>
      f : [

      \ \ u[2],

      \ \ -w[1]^2 * u[1],

      \ \ u[4],

      \ \ -w[2]^2 * u[3]

      ]$

      h : u[1] + u[3]$

      n : length(f)$

      order : n$

      Om : obs_map(order, h, f);

      eqs : [z[1] = Om[1][1], z[2] = Om[2][1],

      \ \ \ \ \ \ \ z[3] = Om[3][1], z[4] = Om[4][1]

      ]$

      sol : solve(eqs, [u[1], u[2], u[3], u[4]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o61>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|3>+u<rsub|1>>>|<row|<cell|u<rsub|4>+u<rsub|2>>>|<row|<cell|-w<rsub|2><rsup|2>*u<rsub|3>-u<rsub|1>*w<rsub|1><rsup|2>>>|<row|<cell|-w<rsub|2><rsup|2>*u<rsub|4>-w<rsub|1><rsup|2>*u<rsub|2>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o63>)
      >><around*|[|u<rsub|1>=<frac|z<rsub|3>+z<rsub|1>*w<rsub|2><rsup|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|2>=<frac|z<rsub|4>+w<rsub|2><rsup|2>*z<rsub|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|3>=-<frac|z<rsub|3>+w<rsub|1><rsup|2>*z<rsub|1>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>,u<rsub|4>=-<frac|z<rsub|4>+w<rsub|1><rsup|2>*z<rsub|2>|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>64) >
    <|unfolded-io>
      f : [

      \ \ u[2],

      \ \ -w[1]^2 * u[1],

      \ \ u[4],

      \ \ -w[2]^2 * u[3],

      \ \ u[6],

      \ \ -w[3]^2 * u[5]

      ]$

      h : u[1] + u[3] + u[5]$

      n : length(f)$

      order : n$

      Om : obs_map(order, h, f);

      eqs : [z[1] = Om[1][1], z[2] = Om[2][1],

      \ \ \ \ \ \ \ z[3] = Om[3][1], z[4] = Om[4][1],

      \ \ \ \ \ \ \ z[5] = Om[5][1], z[6] = Om[6][1]

      ]$

      sol : solve(eqs, [u[1], u[2], u[3], u[4], u[5], u[6]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o68>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|5>+u<rsub|3>+u<rsub|1>>>|<row|<cell|u<rsub|6>+u<rsub|4>+u<rsub|2>>>|<row|<cell|-w<rsub|3><rsup|2>*u<rsub|5>-w<rsub|2><rsup|2>*u<rsub|3>-u<rsub|1>*w<rsub|1><rsup|2>>>|<row|<cell|-w<rsub|3><rsup|2>*u<rsub|6>-w<rsub|2><rsup|2>*u<rsub|4>-w<rsub|1><rsup|2>*u<rsub|2>>>|<row|<cell|w<rsub|3><rsup|4>*u<rsub|5>+w<rsub|2><rsup|4>*u<rsub|3>+u<rsub|1>*w<rsub|1><rsup|4>>>|<row|<cell|w<rsub|3><rsup|4>*u<rsub|6>+w<rsub|2><rsup|4>*u<rsub|4>+w<rsub|1><rsup|4>*u<rsub|2>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o70>)
      >><around*|[|u<rsub|1>=<frac|z<rsub|5>+<around*|(|w<rsub|3><rsup|2>+w<rsub|2><rsup|2>|)>*z<rsub|3>+z<rsub|1>*w<rsub|2><rsup|2>*w<rsub|3><rsup|2>|<around*|(|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*w<rsub|3><rsup|2>-w<rsub|1><rsup|2>*w<rsub|2><rsup|2>+w<rsub|1><rsup|4>>,u<rsub|2>=<frac|z<rsub|6>+w<rsub|3><rsup|2>*z<rsub|4>+w<rsub|2><rsup|2>*z<rsub|4>+w<rsub|2><rsup|2>*z<rsub|2>*w<rsub|3><rsup|2>|<around*|(|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*w<rsub|3><rsup|2>-w<rsub|1><rsup|2>*w<rsub|2><rsup|2>+w<rsub|1><rsup|4>>,u<rsub|3>=-<frac|z<rsub|5>+<around*|(|w<rsub|3><rsup|2>+w<rsub|1><rsup|2>|)>*z<rsub|3>+w<rsub|1><rsup|2>*z<rsub|1>*w<rsub|3><rsup|2>|<around*|(|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*w<rsub|3><rsup|2>-w<rsub|2><rsup|4>+w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>,u<rsub|4>=-<frac|z<rsub|6>+w<rsub|3><rsup|2>*z<rsub|4>+w<rsub|1><rsup|2>*z<rsub|4>+w<rsub|1><rsup|2>*z<rsub|2>*w<rsub|3><rsup|2>|<around*|(|w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*w<rsub|3><rsup|2>-w<rsub|2><rsup|4>+w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>,u<rsub|5>=<frac|z<rsub|5>+<around*|(|w<rsub|2><rsup|2>+w<rsub|1><rsup|2>|)>*z<rsub|3>+w<rsub|1><rsup|2>*z<rsub|1>*w<rsub|2><rsup|2>|w<rsub|3><rsup|4>+<around*|(|-w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*w<rsub|3><rsup|2>+w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>,u<rsub|6>=<frac|z<rsub|6>+w<rsub|2><rsup|2>*z<rsub|4>+w<rsub|1><rsup|2>*z<rsub|4>+w<rsub|1><rsup|2>*w<rsub|2><rsup|2>*z<rsub|2>|w<rsub|3><rsup|4>+<around*|(|-w<rsub|2><rsup|2>-w<rsub|1><rsup|2>|)>*w<rsub|3><rsup|2>+w<rsub|1><rsup|2>*w<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>71) >
    <|unfolded-io>
      f : [

      \ \ u[2],

      \ \ -w[1]^2 * u[1],

      \ \ u[4],

      \ \ -w[2]^2 * u[3],

      \ \ u[6],

      \ \ -w[3]^2 * u[5],

      \ \ u[8],

      \ \ -w[4]^2 * u[7]

      ]$

      h : u[1] + u[3] + u[5] + u[7]$

      n : length(f)$

      order : n$

      Om : obs_map(order, h, f);

      eqs : [z[1] = Om[1][1], z[2] = Om[2][1],

      \ \ \ \ \ \ \ z[3] = Om[3][1], z[4] = Om[4][1],

      \ \ \ \ \ \ \ z[5] = Om[5][1], z[6] = Om[6][1],

      \ \ \ \ \ \ \ z[7] = Om[7][1], z[8] = Om[8][1]

      ]$

      sol : solve(eqs, [u[1], u[2], u[3], u[4], u[5], u[6], u[7], u[8]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o75>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|7>+u<rsub|5>+u<rsub|3>+u<rsub|1>>>|<row|<cell|u<rsub|8>+u<rsub|6>+u<rsub|4>+u<rsub|2>>>|<row|<cell|-w<rsub|4><rsup|2>*u<rsub|7>-w<rsub|3><rsup|2>*u<rsub|5>-w<rsub|2><rsup|2>*u<rsub|3>-u<rsub|1>*w<rsub|1><rsup|2>>>|<row|<cell|-w<rsub|4><rsup|2>*u<rsub|8>-w<rsub|3><rsup|2>*u<rsub|6>-w<rsub|2><rsup|2>*u<rsub|4>-w<rsub|1><rsup|2>*u<rsub|2>>>|<row|<cell|w<rsub|4><rsup|4>*u<rsub|7>+w<rsub|3><rsup|4>*u<rsub|5>+w<rsub|2><rsup|4>*u<rsub|3>+u<rsub|1>*w<rsub|1><rsup|4>>>|<row|<cell|w<rsub|4><rsup|4>*u<rsub|8>+w<rsub|3><rsup|4>*u<rsub|6>+w<rsub|2><rsup|4>*u<rsub|4>+w<rsub|1><rsup|4>*u<rsub|2>>>|<row|<cell|-w<rsub|4><rsup|6>*u<rsub|7>-w<rsub|3><rsup|6>*u<rsub|5>-w<rsub|2><rsup|6>*u<rsub|3>-u<rsub|1>*w<rsub|1><rsup|6>>>|<row|<cell|-w<rsub|4><rsup|6>*u<rsub|8>-w<rsub|3><rsup|6>*u<rsub|6>-w<rsub|2><rsup|6>*u<rsub|4>-w<rsub|1><rsup|6>*u<rsub|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>79) >
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