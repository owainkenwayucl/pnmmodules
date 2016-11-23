package main

import ("pnmmodules"; "fmt")

func main() {
  var img [][]int
  var i, j int

  img = make([][]int, 2)
  for i = 0; i < 2; i++ {
      img[i] = make([]int, 3)
      for j = 0; j < 3; j++ {
          img[i][j] = i + j
      }
  }

  pnmmodules.Writepgm(img, 3, "test.pgm")
  pnmmodules.Writepbm(img, 2.0, "test.pbm")

  for i = 0; i < len(img); i++ {
      for j = 0; j < len(img[0]); j++ {
          fmt.Printf("img[%d][%d] = %d\n", i,j,img[i][j])
      }
  }
}