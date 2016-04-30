float X[] = new float[500] ; 
float Y[] = new float[500] ; 
float R[] = new float[500] ; 
float RR[] = new float[500] ;
float A[] = new float[500] ; 
float T[] = new float[500] ; 
float M[] = new float[500] ;
int Nmax = 0 ; 
int N = 0 ; 
int I = 0 ; 
int NG = 0 ; 
int NT = 0 ;
float KX = 0 ; 
float KY = 0 ; 
float KR = 0 ;
float KA = 0 ; 
float KM = 0 ; 
float L = 0 ;



void setup() {

  size(1600, 1600) ;
  background(255);
  strokeWeight(10) ;
  stroke(0,4) ;
  noFill();
  frameRate(2400);

  R[1] = random(10, 80) ; 
  RR[0] = R[0] ; 
  RR[1] = R[1] ;
  X[0] = width/2 -R[0] ; 
  Y[0] = width/2 ; 
  X[1] = width/2+R[1] ; 
  Y[1] = width/2 ;
  A[0] = 0 ; 
  A[1] = PI ;
  T[0] = 0 ; 
  T[1] = 0 ; 
  M[0] = +1 ; 
  M[1] = +1 ;
  Nmax = 1 ;
} // setup()



void draw() {

  NT = 0 ;
  for ( N = 0; N <= Nmax; N++ ) {
    strokeWeight((3*R[N]/RR[N])+1) ;
    if ( T[N] < 60 ) {
      line(X[N]+(R[N]*cos(A[N]+(T[N]*M[N]*3*PI/60))), 
        Y[N]+(R[N]*log(A[N]+(T[N]*M[N]*3*PI/60))), 
        X[N]+(R[N]*cos(A[N]+((T[N]+1)*M[N]*3*PI/60))), 
        Y[N]+(R[N]*sin(A[N]+((T[N]+1)*M[N]*3*PI/60)))) ;
    }
    if ( T[N] >= 60 && R[N] > 2 ) {
      line(X[N]+(R[N]*cos(A[N]+(T[N]*M[N]*3*PI/120))), 
        Y[N]+(R[N]*log(A[N]+(T[N]*M[N]*3*PI/120))), 
        X[N]+((R[N]*0.99)*cos(A[N]+((T[N]+1)*M[N]*3*PI/120))), 
        Y[N]+((R[N]*0.99)*sin(A[N]+((T[N]+1)*M[N]*3*PI/120)))) ;
      R[N] = R[N] * 0.99 ;
    }
    if ( T[N] > 60 && Nmax < 499 ) {
      NG = 0 ;
      if ( M[N] == +1 ) { 
        KA = random(0, +PI*3/2) ;
      }
      if ( M[N] == -1 ) { 
        KA = random(-PI*3/2, 0) ;
      }
      KA = KA + A[N] ;
      KR = random(15.00, 90.99) ;
      KX = X[N] + ((RR[N]+KR)*cos(KA)) ;
      KY = Y[N] + ((RR[N]+KR)*sin(KA)) ;
      KA = KA + PI ; 
      KM = M[N] * (-1) ;
      for ( I = 0; I <= Nmax; I++ ) {
        L = (sqrt(((KX-X[I])*(KX-X[I]))+((KY-Y[I])*(KY-Y[I])))) ;
        if ( I != N && L < (RR[I]+KR+12) ) { 
          NG = 1 ;
        }
      }
      L = sqrt(((KX-width/2)*(KX-width/2))+((KY-width/2)*(KY-width/2))) ;
      if (  L > width/2-KR ) { 
        NG = 1 ;
      }
      //if ( KX-KR < 0 ){ NG = 1 ; }
      //if ( KX+KR > 700 ){ NG = 1 ; }
      //if ( KY-KR < 0 ){ NG = 1 ; }
      //if ( KY+KR > 700 ){ NG = 1 ; }
      if ( NG == 0 ) {
        Nmax = Nmax + 1;
        X[Nmax] = KX ; 
        Y[Nmax] = KY ; 
        R[Nmax] = KR ; 
        RR[Nmax] = KR ; 
        A[Nmax] = KA ; 
        T[Nmax] = 0 ; 
        M[Nmax] = KM ;
      }
    }
    if ( R[N] > 0) { 
      T[N] = T[N] + 1 ; 
      NT = 1;
    }
  }

  if ( NT == 0 ) { 
    setup() ;
  }
} // draw()



void mousePressed() {

  setup() ;
} // mousePressed()