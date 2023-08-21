<TeXmacs|2.1.1>

<style|<tuple|generic|maxima>>

<\body>
  <\session|maxima|default>
    <\output>
      \;

      Maxima 5.43.2 http://maxima.sourceforge.net

      using Lisp GNU Common Lisp (GCL) GCL 2.6.12

      Distributed under the GNU Public License. See the file COPYING.

      Dedicated to the memory of William Schelter.

      The function bug_report() provides bug reporting information.
    </output>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      Az(q, d) := matrix(

      [cos(q), -sin(q), 0, 0],

      [sin(q), cos(q), 0, 0],

      [0, 0, 1, d],

      [0, 0, 0, 1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><math-up|Az><around*|(|q,d|)>\<assign\><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q|)>>|<cell|-sin <around*|(|q|)>>|<cell|0>|<cell|0>>|<row|<cell|sin
      <around*|(|q|)>>|<cell|cos <around*|(|q|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      Ax(q, d) := matrix(

      [1, 0, 0, d],

      [0, cos(q), -sin(q), 0],

      [0, sin(q), cos(q), 0],

      [0, 0, 0, 1]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><math-up|Ax><around*|(|q,d|)>\<assign\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|d>>|<row|<cell|0>|<cell|cos
      <around*|(|q|)>>|<cell|-sin <around*|(|q|)>>|<cell|0>>|<row|<cell|0>|<cell|sin
      <around*|(|q|)>>|<cell|cos <around*|(|q|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      res : Az(q[1] + %pi, p[1]) . Ax(%pi/2, 0) .

      Az(q[2] + %pi/2 + p[end], 0) .

      Ax(0, p[2]/cos(p[end])) .

      Az(q[3] - p[end], 0) . Ax(-%pi/2, 0) .

      Az(q[4], p[4]) . Ax(0, 0)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      expr1 : res[1][4];

      expr2 : res[2][4];

      expr3 : res[3][4];
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>-cos <around*|(|q<rsub|1>|)>*<around*|(|-sin
      <around*|(|p<rsub|<math-up|end>>+q<rsub|2>|)>*<around*|(|p<rsub|4>*sin
      <around*|(|p<rsub|<math-up|end>>-q<rsub|3>|)>+<frac|p<rsub|2>|cos
      <around*|(|p<rsub|<math-up|end>>|)>>|)>-p<rsub|4>*cos
      <around*|(|p<rsub|<math-up|end>>+q<rsub|2>|)>*cos
      <around*|(|p<rsub|<math-up|end>>-q<rsub|3>|)>|)>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>-sin <around*|(|q<rsub|1>|)>*<around*|(|-sin
      <around*|(|p<rsub|<math-up|end>>+q<rsub|2>|)>*<around*|(|p<rsub|4>*sin
      <around*|(|p<rsub|<math-up|end>>-q<rsub|3>|)>+<frac|p<rsub|2>|cos
      <around*|(|p<rsub|<math-up|end>>|)>>|)>-p<rsub|4>*cos
      <around*|(|p<rsub|<math-up|end>>+q<rsub|2>|)>*cos
      <around*|(|p<rsub|<math-up|end>>-q<rsub|3>|)>|)>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>cos <around*|(|p<rsub|<math-up|end>>+q<rsub|2>|)>*<around*|(|p<rsub|4>*sin
      <around*|(|p<rsub|<math-up|end>>-q<rsub|3>|)>+<frac|p<rsub|2>|cos
      <around*|(|p<rsub|<math-up|end>>|)>>|)>-p<rsub|4>*sin
      <around*|(|p<rsub|<math-up|end>>+q<rsub|2>|)>*cos
      <around*|(|p<rsub|<math-up|end>>-q<rsub|3>|)>+p<rsub|1>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>