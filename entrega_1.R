---
title: "Entrega 1 estadística"
author: "Pau Mir, Maria dels Àngels Guinovart, Eneko Martin"
output: html_notebook
---

rm(list=ls())

Per_dau=function(n, N=1, sig=0.05) {
  # n: nombre de llançaments per experiment; N: nombre d'experiments; sig: significància
  R = replicate(N, sample(c(1,2,3,4,5,6), n, replace =T)) # Fem N experiments de n llançaments, matriu nxN

  # Calculem el valor de X²
  xi2 = rep(0,N)
  e=n/6
  for (i in seq(1,6)) {
    xi2 = xi2 + (e - colSums(R==i))**2
  }
  xi2 = xi2/e
  
  #Contem la quantitat de valors aceptables  
  p=sum(qchisq(sig,5)> xi2) #no sé si aquí ha d'anar sig o 1-sig
  return(p)
}

Per_dau(300,20)
