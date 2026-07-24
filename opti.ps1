#requires -Version 5.1
<#
    OPTI-DYLAN TOOLKIT PRO V15.1 - THE ULTIMATE CONTROL SYSTEM
    Corrections apportees a la V15.0 :
    - Id=8 : le tweak NetBIOS "Size/Small/Medium/Large" etait invalide (valeur de
      registre qui n'existe pas), remplace par un vrai tweak TcpTimedWaitDelay.
    - Id=10/11 : DCA et NetDMA sont des parametres netsh retires depuis Windows 8,
      remplaces par des reglages netsh reellement supportes sur Windows 10/11
      (fournisseur de congestion CTCP + desactivation des TCP Timestamps).
    - Timer Resolution : la resolution du timer ne reste active que tant que ce
      programme tourne (limitation reelle de l'API NtSetTimerResolution). Un
      avertissement clair est maintenant affiche a l'ecran et dans le log.
    - Sauvegarde de profil : ConvertTo-Json refusait les cles numeriques du
      dictionnaire d'etats des cases. Corrige en convertissant les cles en texte
      avant serialisation.
    - Ajout de 5 nouveaux tweaks reels (Ids 140 a 144).
#>

# ============================================================
# ICONE DE L'APPLICATION (encodee en base64, un seul fichier a gerer)
# ============================================================
$Global:IconBase64 = "AAABAAcAEBAAAAAAIABBAgAAdgAAABgYAAAAACAApAMAALcCAAAgIAAAAAAgAKIEAABbBgAAMDAAAAAAIAAIBwAA/QoAAEBAAAAAACAA0wgAAAUSAACAgAAAAAAgAPkOAADYGgAAAAAAAAAAIAD6BgAA0SkAAIlQTkcNChoKAAAADUlIRFIAAAAQAAAAEAgGAAAAH/P/YQAAAghJREFUeJyVkzFrVFEQhb+5772sSXYDm2gCprFTRFKohS6KFmJpI8TC/ARTicFGQSwstBArQdJbWArpLMQmBgW7oNgoWqgEE7P7snlv7rHY3WRjguIU995i5syZOfdAJ4z/D+sdBgjGakNDxaxEA5QB1kkJoAgBEa0ELWWZPVpbW1sBzIBQr9drGxvlixDC8V19PKIsxdy76SBp2czPNZvN7wGI7bbPhhCOS2pLckkuM1ez5cX0eddozVWULuSS2mZ2RErmAIUu4hkgAimQkISEVjOJp48l5bXLiX1bSRjIEkQCpBIRaHQHpHeHLdoSBmw+nsN+tbB8Hdwhir58Y0dRL9IEW1+lmJ0mTjWw959RvYYmD8BgpR+E3QDBoNXCT06x+fA6sEI5c4H843Paz+5CQkcw21Y93Utgn7lIePsBjQ+iyYPIMgau3sJ+/ES1Kvg2i50MoqCyj+z2PIMnrpAsvAabILv3hHThJRqpgce/jNBdIB5RqBDPThGWF8nuzKOhkc4i/1xZr4yOjJ35ihJNjKLRGpVLN7HC0UClv/vWo8dgsfsuMKJttl1HD3l6/6kni+9cw8OOR+8WlmYE0BJ0vVCtVsfcw6sQ7DAApaPxOqyuQ+mYGWLbcZI+SUUjz/OvW2aqVqv7pXBD4hSQUZZGSHd8L6AE3kjFgzzPv/Rh7mHnfxvcAH4D9UfvJ9HRehgAAAAASUVORK5CYIKJUE5HDQoaCgAAAA1JSERSAAAAGAAAABgIBgAAAOB3PfgAAANrSURBVHiclZXNixxVFMV/99ZHd1VPZyaLODHGUdCYrPxYuHYliEoWSojBjaBiIDIgRIUQMCiikMUEFZFkoSsh4NLZxD/AjQiuFBWMrZMsxhnptGN1V1e96+J1TWqmq0c98Prj9n3n3Hde9b0wjaAh9l8R7g5Iw3cDaLf3L0VR0Z6RV8EA8lzz0ajfA1ydo75RJsul6dyLZvqqCMeANk0QAbN6JAd+NrMrWTa4VOO16oN68u5HInrG791BsBPjAuJol4ggAs65q1k2eH5CYIr3zaVp9wVPbmOwskrYscyMMDD30P3GuDBEar+bM7NcVU+m6fzZiV2BAiUQmMnrZrjJaYKabX6FgUg2kOLlp8Q99rBIviWo1nMUCM3MmdlrQAoUCli73T4swgOTE+mUJSowHOEOHSK/cBr5oTepYcpGBUREFtN0/mgVIAzDhIZH7La9iuRD8g+WYW4BvX4Tk3D3RVcwwJwr020B8V42IwyQQZ/i1BOUzx5HNm/AXxkkLQiCicvTJYHnnF01eGtGOXbXQfKVZbASWfsD/bVXrwDrdGad5l8ERJFRxmjlPLZ4GGwLW5gjv3DaV64tpPcb4aerEMWNIrMFwgC59SfFM49TnHgSxn2IFLv7TsZvLeOtjmmdOANFAa0WlNMCjQYiAsMcd+8S+ZU3fVrU8u9WwHAdcETvrhB+cQ06c1C6/2mR+JfWqbehyMEZ+eU3cEfugXaCfvMt0TufYZ194MrZRjRGzSAMkbV19PoahoNOF+sm/q8y3KL10vtQlBDHM6uHWRZVInGEze+DIMY9eB92YD9Ii/jcx+h330Onsyf5toCZNbdjM3CGlGNsaRGCgwSr14guXcXmFvzlziivaqQKEATBCN+TpiEAJe6RI/D3OvErF7E43qtoAURER5WA9Pv938F+wXfAnc+aGaC4R48Rn72Irt2AdgtcozUOMDO3mSThj5VAAIzN+FBEFCgmiR55gbvjAMHq14SXv8Q68/5yG21hPOH4ZHNz8xYQ1tstSdL9XFVPWn3imBlxBGXpL1SlaRZNbBGcc19l2eA4fsqZUhsoWTZ4zszOAT2/SQRVJS8UZ4qqYijIroWYcdM53suywdPAsOKcNcyTNJ0/6pxLtiuMgHGjLajqKEnCnzY2Nga1E83s0Hs3wL1RTcJt/AMgynHBMouFEgAAAABJRU5ErkJggolQTkcNChoKAAAADUlIRFIAAAAgAAAAIAgGAAAAc3p69AAABGlJREFUeJytl12oVFUUx39r7zMfZ7wz9+pVQgItUkwl6iHEUAyhgp6ShAh9k6iHorCbhBQSfZCECZUhRUQP+WQvEkjZU1BqCfWQSBBUlCFi5Hx55849Z+/VwzlnnHvv3Jlj9ofDwJmz1v+/115r7bWF4bCApM9/gaaPT39zw9wE6WKwg14OIrGAAwjD2r3AJhFWAKhqLlEioqoqxlB3Ts/NzLRPk0Sg53sxARZw5XL1PmPkILBN5OYCoQqq+qOIvjw93To5X0S/95S89rgxfCoiVlV1vuIFEMBrsj4zUKwREQPgnJ+amWkd7heRWVjAhWFtkwhn0vcOCHKRFwKwBjqzi4lIyESs925Hp9M+kXGa9AMFRJV3UrWjyQHEQKdL9Myj6PgYuEWDZQGSiMq7K1eurJBUhhiSjPeVyvg9xshmVfW5yAOLtJu4x7bjdj2IuXgZioVhFhbwxphV9Xr7gXTRNhOAqm5N882PXrlAFKPVMWaP7EP+uAxxF4wZZZn2Bbk/89RX77piJHFvLRbptIgO7EFXrMNc+C11l8tagIxLe5JFZHi295M3m7jtm4n27gZtwuWr3GCj63H1BORqMgLEMVpdwuzRqSTkEiF/XgGxadOW5Bntaa6AXMhC/9oT+HUbwXUAh/n9UtJxuhFEMcxGwypiDkZne4/cIK12Evpnd0HcgKAA3WsQO/zy5VAuJH1BLLgYabTSNLtZAQI4j4ZlZt/fm4Y7TehCQPert5PvsnMPS+mRfcjZ8xCG4BcvrHxbYC0y3SR6cTd+/QboNvs8GHRiAp1Yii6topOrCT4+gf32B6hUhpLnE2AM0r5G/PA2ogPPAQKlSbBVrldwDPEMEGLOfkPhpQ/QShX86DzIsQWKGoPefQfBsc/BTQOCVsq4HVshCEh6SxG51qb45FtJHlgDbnRPGy3AK5RKBAePIcySHWRu/Vrczu2gPiEKahT2v4796We0tgziePTacgmApMTGKqhZklZDE79pA0gFuv9AaRn25CkK7x1HqxO5yfMLgCSZsojGEXrnqtRDCblyieJTh9BiMRF7A+hvxfksFSDAb7wd1IEtUXz6EObiJSiXki3L6WWOAFUdODQugHNoOURX3wIyRvDRZwTHT6HVcYjzdT/6BtSeAGOoM+pEyY7hyRp+zW3Ir+cpvnAEDZeMrPc+qIjWM4+GdGeN4YwqwrDeYASJInTNrVCpUtrzBtJoQ6GQd++T40rkdCYmEyCtVuucql7g+jw4wFyACL/lLoKjx7Bff4/WanlD7wHxXv8OAvki4zGk8ywQi/C8JHP44GnYe7QQIr9cpPjKJ2hpDFyukvOAExEj4vc3Go16yjlnBkgn4+peY8zhJKLqmJ8XItePWmvyzCECWBHBez3c6TSnGDCWzxMxvlNE3xSRtQvcaWaVBWo0VPUvkFenpxsfMuRiMkcEEIbh2EPGmC3e92a4vNckBRChLsJ3QSBfNhqNq6QTeB4H+XrCjSH35bT/v/9LyMJcSvEvQVa9OQzZIIEAAAAASUVORK5CYIKJUE5HDQoaCgAAAA1JSERSAAAAMAAAADAIBgAAAFcC+YcAAAbPSURBVHic1ZptiFxXGcd/z7n3zszOnZfstmk2dZNqIhoUX6rWb1VMoYFq/BIaK7ZIhbSgpAkVLbQfhFIN+NK0yga0UhS0olQpomKoCEU0imApYqFK13QteTFpmtmXmZ07957HD+fO7uxkdnf2zk2pf7gw9+Wc8/+f8zzPee59Bv7PIRnamIzthoH2HLnCAH7ena4DLx1zQwwzkx6QdE9KpfGdnmd3pQPokH1sBAUwxr46Pz//byDuGduyzoqsN3j3nhaLtd3G6F0gnxRhD8hYDqQHQGNgBvgtyA+bzcbfergMFLGWgGXy5XL9S6APiUhdlW4/Nj/Sq2AARARVtaDTzeb8A0ArvXfFuIMESPcol+tPiXBQHfOYFQfevNmIgG7om10HtoAnIqLKX41JbltYWLg4SMQgRzGAHRur/iQl30k79ckagUQgTiCxG7UWVgKGqGpHhJuSRJ6dmJioMWDy+gV4QBKG1S8aY25PyQeZSPeS78TotXXYUoF4U9YXqGrHGPP+ViuexgWTVZxN329bKpVuUJWHVTUhr9CpSuehu9BSAax1ooZHoKqxMXJnGIZ7cSK8tQSoSPA5ESmTR4j0PWSxQXzfAZJbPoS8chaKwTC+MAiq6h3tv9grIAEE5IA6rx2NvBFYWsLesIPokSOYF08jxGCG2p/64amqAHsrlcpWekyp25sBtFQqTYmwmxVnyg4RpNMh+s5RKG3F/Os/I/UGWJDQWnNjz7VlkgLgecW3g5TcwyOsgO8h8w3iT99Ksv8W0DnkzMXs9B2si8S6p5dz/yyPnhYYgXaEbp8k+tYRSCKQBDl93g2Xzf7X5DiamQzs3iDtFu3jh9HJKbAR2Bi5NAdics8z8xXQNZ079pF8aj/ElyEoQNREzlxEPT+PFViF/ASIMx27fRvR8SNg22m895HXGm4F/DezAONMJ3rsMDq5A7QrwCD/vQyLLfA9d23QkRH57LS+h8ylpnNwP8QNRzZxm6bMnkfai6ipunxoFdT5RZCNyugCRCCK0O3biB47Chr1rasg5y6h4zW0WndJXS8U8AzyWiPTSowuwDPIYov2ow+i26YguQxemqp4HrBIfOetJAc/diXBOEbLExS+Mk3wzR+h1UErdDUF+B4yN0d8283Ed3wcksYK+WUohGU07J/dBKhiTv0Zf/pptByC3byDZxcgAlEHHa8TTd8Puk6ur32vtaqgHtJ6neLdx5AoRscCl6luEtmjkDHI0gLRI4fQt+6CaN7NYJy4o3c2hdURxyp4IcH9xzEvvYyGYSbykHUFPIMsLBB/5hPEn78XaELx2p4HBPcaG3HFsiQJ+HW8X54keOKZ1LFjsiKbAKto4DalwpePuU3LpESNgaUW8YG92JtvAttaSaGtBVNCzsxSuPfraLE08saWTYAqBAX8p07i3vW7Xz3SjYuE5KMfAALQ5ko7C/g+hfsexZy7gNYGhNU3RACAKlqtDIzdKoK+dzfQcQkcODPxr8E/8QP8n/8OrY2PTB5GDaP9Mbsbmd6yFTt5DRCnryIW/BDz0j8oPPhddGzz8X4t5JuNGkHiDnb39VCugU2dUw3ECYW7vwpzi7kmdfkKEAGN0Xe/zb3YWetm2qsSfO37eKeeh2o1zZHyQf4vNIDu2el+JAn4Ncwf/0Th4SfRymghcxDyFWAVlQD7zp1AB0wBabxO8Z5voHJ1ygr9AkYTlCRoNcTuut5lpUGV4IFvY178J5TLmXfb9Th2T7rf52dBO6zzOXtNiEAUw+QEXFcHCfF+8SuC7z2DVrfkYTri/N6bWcU5PbEA8/PzL6vqq5kEGIGkg33HDrR8HXJ2luIXjqOFQh4RRwEPNFJden6QAHB7QiLCb8RtTptbbxGEOLX/EoVDx5BzF6BYzJQm98G6kgF/WVpamqXnM3uvgHSU5AlXXMjmcfYj78N/+mf4v34OrdVy2W0dNxFVTqTny7z7v416zWbzBdATIuIBnaGH6MRopY6cv0Rw+HG0FOa128Yi4lurzy0tzf005bzsUP2zLIBMTU0VL11q/EHEfLCnRrA+Egu1EN0SIjNnYayYR9SJQXxVvWCtfLjdbrzC8nfSwQIgta9KpbI1ScxJY+TGtFbQvbe2aVl1pAv+KHbfLTFpOvPnRcy+ZvPyC/TY/noCWHlwvB6GyeMgnwVIa2W2v5NVGK4WtmZrXG2MdLzfJ4kcarcbM/SVezcS0CMCyuXaPuAeYK+IbMnKbhioakuVU8bw5OLi3I/7ufRjo0jTLapZgDAMt4H/Hmvtu4ZomwUz1pq/t9uN04PGHwVDl/5zgtBTB9vowc12/Eb82eNqFdLffPgfq0fDosSKHroAAAAASUVORK5CYIKJUE5HDQoaCgAAAA1JSERSAAAAQAAAAEAIBgAAAKppcd4AAAiaSURBVHic7ZttjBVXGcd/z5mZu3v37e4usLwUaBUtBZMSY9DyoVG/1Jb4ydSaxrTBNFDEQNOU1ERrP2hifaFRU1sTICaKwY+N0diKIRLB+JGWFguBYhpRU8WyL/fu3b0z5zx+mLnLsvdl7+6dmdTIP5ls9s7MOc/5P885z3/OPAO38P8NeZ+1s1Rotw10Y7iX3K+A7daQZcIkhwKOZRCyHAK8Jp0VS6VSTxdtLgUKiDHGXb9+faID29piKcbWr1WA3t7BHSJ8BtghwhZgQLsOyKVArAjngbOq+odqdep3wGxy0hATsXgrHfY212Bv79DDxrAf2CES3675jnwO9f4TGy4Ax6enJ78L1IijYdGp2QkBHmCLxeI6CI6KyAMioPGobdJG/cgb9XAXwBMRnNPzqu7xmZnynwAfiNo1sJjRyeCHtgO/MkbWqqqdd+79BBcf4oNGIPumpyeOsEgktCPAAK5YHPo46KvGmBFVjYhZzQZGQLXb5GYBAyLAnsVIaEWAAejr6xtT9V8XkTFQS5ZeNwIzIXgGfC8mYvlI0qJ4InpfpTL5e1qQYNo04lS9nxkjY3FIZTz46iy6ZSO6qgRhlDhw2UjWJFXnOFYqlUaIp0hDo80I8ADX3z/0BRFzX+ZhL4B10N9L7bnHweva+3UYwBkjq8PQfYs4KhrG24wABcQ5fTpxQraru+ch1Slq396N3rEG887foKeQGgmqqqryWF/fyrXcyFo3LlhoDuAGBwfvETHbVNWRZeh7BilXsNu3EX3lS8jlv6PpdieANUZ6IXyk3uv8CxYSIABRxE6ROVmZDUTAOrQnoPaTp4Ai5tzbCFG8JqTYE4Cq20kThbiQgPrJ7fNvzgSeQaanCL+xC/exjwKTSLmaRZcm1myydXR0dIAFi+F8AgRwK1asGBRhayJv22WJ5cMzSGUae/ddhAcfhWgqNuCNK0Bqi2AdAqiIjERRtDn5bW5cDQMMwzBQZShNCxqg8fND+MMDEPTGP0Q1KFfBmBSe8pv1iG+tlBaeaCBARLJ9vvc9pDxO9MRD2E9/Mva+X0DKE5hLV1E/SDsC5qPhuaBViGcz941BpqvYLR8m/OZecOXY4xBrgewfpzoSQplCnSN86Sl0oAQaJuFewFx4B3n3PShkGgENyI+A+aH/qXshmoxVHwCxFMZll3VbIR8CGkK/Ej/0QOJtH3P2EkKYtgZY3LS8OmoI/YUPO9MzeZlyE7InoG3ok3g8xJy9FO9lQExOuyNN81JtbSHahf58qIXJ6fhvGMUZoRVUwfdTyxjZEoDeHPp2Esw876uC8ZHJceTf47ixMQj81llAFQIfeW8qtbSZHQG+h0yOEz75xST0x+OdnvkQARw6WGT29I/bt2ctWijhnTxDz0PPQKEnlXSZDQFGYGYWt/42wmcfAzfdPPTrEEGHG1TqPMSZQqYqBM8eRRRUJBUCslkExSC1WcIf7UeHV4HWFl+8NGp9hDUgINj3Hbw3LqB9xdQ0Q/oRUA/9Rz5L9Lmd8bz3OtjkaEWQtRCM4r38G4JfvIoOjkCU3qNKuhFgBGZncevXET5/ANxsd2nLOTBFzJXLFPYeQnt7QdNViylPAUFmq4Q/2I+uWgNRFdB4IDcdHc5dFRCPYP8hzL+uQaHQ+b0dIr0p4BmkXCbc+3miBx8EJqEw2ORCIX7anqVtHrMWvGH8F3+O/9vT6NBwqqFfR3oEOEULPZg3r9DzwG6gyd6+CFILcRvGqL10EHoCkCYetQ68fszrr1E4+ALaN9heHHWB9AhIFJo5cw5p3H1OYBBqhPduh96BOD2KaWwHAzai8OVDSC1C+wv/AwRAbPxAMc7RTXvzYHIcvWcrEMTzeeEqZB34wwRf/R7en1/LLPTnTEq9Rae03tQTsIrbtK75aWvBL+GdOk3w/ePowFCmg4e8d4RUUXz0rtsBe/MaoQpSQK5fI9h3CPHrJUjZIj8CRCCy6PAA+oG1wII9AevA9BI8cQjvrctoMT211w65EiBhDf3gOtza1fGmSH33x1rwR/BefoXg2Cupq712yJEAwEbo7WsgKN5QdDmovXbIdwpgcR+5g7kMALmovXbIjwAF8NDNG4mLNyRRe0P4Lx5P1F4pt9CvI78XI86hJkA/tB6wcejnpPbmoaMXIwoSptttkgFWDOE2rQVqIN5Nag/PZP1CxIlI21djCpiJiYkJ0ItJEWI6LhEgitB1K2NlZ2vgDxJ87YVY7Q30Z+l9BYyqm4LoreS3uc4WRoAh3m06m9yYjktEEBvi7t4EPUXwBvBOnclL7WnizLfL5fJ1bhR4A40EJCe8E6opVn8mGUDv3ACuiPwnV7WXeFtOEb8dblsi4wAZHR04qer+KtJ50XFbqKJ4uM0bwRQo7H8+T7VnVNUa4/00+b9tiYwC5urVq1UROTq3b90tnEIQ4D6xBe/Er/F/mZvasyJiVPVkpXL9PB3UCJFcYKanJw85p5dExKebggkRmK2hG9cgExUKu55De/ryUHsKoKrW9znQ6qJWdYIANdBHk6rwmxaOJaEugTesJvj6Ycw/381L7UUi4qnqwampqYvQvOqt3QrkAbavb2A3eIeTWmFhOeoxeaVFLUyzErRlb8SDD5xzR6rVqT0so1i6Dh+I+vpKu4HDSRDUV9KlLd+qSTX4ku5aKixgRESc0yPV6uQebnxT1LTnxbwZAX5ccq73A/9I1gRJztlWDTdAMhl8/WOpKO5CPCAE92Qng4fOvegBtr+/f0zVPAOyS0QGYe5zmfRE09JgQEi+YLGqnDDGPl2pVN6kg8HD0sJ4bh4Vi6O3iYQPg9yvyjYRVopInrVNAKi6CREuisgfwRyrVMbPLbR1MSxVhtUXwbnGR0ZGSjMz9k5jZGCJbXUFa631ff5SLpevLbAvHe2yCAzxApl7mV0TCF3YkoYQX15qTAfL+lr0Fm7hBv4LvXS/WtSRIbIAAAAASUVORK5CYIKJUE5HDQoaCgAAAA1JSERSAAAAgAAAAIAIBgAAAMM+YcsAAA7ASURBVHic7Z1bjCTnVcd/56uq7unL9MxsvN6AQERW4MEvCUEW2QR8WTsxsb22hQgOxE5sbIiiPKAImUuMgmxshGIbiLJIkAsbwE6kCDmJ7XVIHCfrYPCFBwfxkAf8FFmxNusd7XT3dE93V32Hh69qtnd2pqdvs1NV3T9ppJm+TVWd/3e+c/71VTXMmTNnzpw5c+bMmTNnzpwZQvZ7A7aQtu3ZS3S/NwD294An/9uLf+/t47bsBz5uv238A/sgiv0QQBLwcOsTBw4cqImIqmquM8HqqmfhdHObpwLccbloQrhYB1pwgY/Y3LmD1Wq1vWCt+Rjgq+phETmsqhYwF2m79gnpgv6jiPSAFxcW/JdWV1frfS/wcccp2vMt2et/gAtmkuIol2vvF5GrrNV7RLQsYqoAqpCSafGiIOIOvbodr6vqSyJy0hj7xWazebr/pezhgdlLAXi4wGu1Wr3EWvMHqnqlMeZ62NxxOJfyDLkf+eeRZMPA/SmIgLV62hj5gqr+oNWqfzt+7Z5NDXslgCTdUyotHhWR4yLylniUJ6nN2+NtyApJUG38u9+XHZ7yPL2r0WiciV8z9WywFwffALZSqb0P5I+A6+PR3ouf8wa9eQ59A0REVc+I8LlWq/4QLgtsDq5pME0BSPxjy+XFm0C+ISKensv1sz7SxyECPBHBWj0RBHykXq+vMkURTCsoydxtyuXaEyJyNK7mLa6inTM+CoQgAdhV4I5Wq/EMri6Y2DuZhgCS4EupVPumMXKjqvbP8XOmQ3JMI9BbWq3GCaYggkkFkKT9/uD32Kxs50yZPsdQb55GJphEAIm5Q6lU+8Y8+BeNfhEkmWDsmmASAfhAWC7Xnozn/HnwLx6bIjDGXt1sNl8gjseoHzSu8eIBYam0eBRyGvy4F0dT6U4awIqIZ635K84V2iMP6HEygIdz995rrfle32P5afNEQC1ECgUfQpvWvYviVvupVqt+M2NMBeNmABtF8pciMrbyUo0qdLt0v/Qn6CXL0OudywjpwnPZV45Wq8tX4oI/Uts9qgA8ICqVFm8Wkavidi9ffb5noLtB9MEjhB++CdqdtAY/wYhgo8g+eOjQoQrONxh6g0cRgAC2UqlcCnx11H+UCYxAtwfVKp3HHsD7/suYet1NA+msBcBlgcgY+fV6vXUv8fmEYd88igDiDzW/a4wp4SrOfJ29U6DboXP8z8AcxDz7CrTWIUi9p+U7y10+cfnllyfdwFCDc5QAWkCt5QPxh+cr+J6BzgbRb11LdOt1oC2olOKCcL83blcEsCLUfvzjn/wq506v78qwQfSAKF7M8f7cWb1x6telRbpfvg+iDRAPSsU0p/4LEJFCFEUPMkJLPqwADE5lvyEiSt8Kn1wQp/7uv9yHlhZdC9ipY06+inoB2EyIwMRnXt9dqVRWcB3BrtPAMAIQoHfw4MGKKh+OF2zmp/LvT/03XAu2DX4B6axhnv8heMWsCECA0Bjjqfp3xY/tGqeh5/F2u70AWh5361LJ1tRvO+eeU4HKAlkoALbgqdplplgE+gDWmo8ZYyq4M0/5aP/OS/010J4TBRoHPxMFYD++mwXknpWVlRpDxGqESl6Gbi0ygWeg3To/9XsmTvdFzMlXkXrdtYAZKgQdWrzssstaw7xyGAFEQFHVXhOv7sp++ycCvRB960G6X/6US/2JtDcF8ENkvQmFzDU7kYgUfvSj/7sm/ntgvHYLpgB2ZWVlATgy5HvST+AhG03Cj9+Cli6BqBun/gTrWsBseAD9xH6AFFV1qHgNFcy49VufcOPSge8hZ9cIrz1M+MmPgm2Cv/UwZM8D2IqIDBWvUUZz9ke+ANaiS1XCB+5BK1Xcesu+c//Gg85a1jyA7ZiqE5gPAh9prtH749uJ3nMl9M6Ct2WO9zykU8+aBzA2syOA/tT/h3dA703wd/BJxGTVAxiZ2RDAdqnfDFjlYyT3Iz9hNgQwTOrfRGCjl+kCcBTyL4BRUn9ogTL+P53AnP4plAq5F0K+BTBq6k/etNHNfeAT8i2AkVJ/HztliBySXwGMkvr7UXUZIEenPQaRTwGMk/pVISgg66fwj59AC6W4Jsg3+RTAuKkfwFrXBcwzQEYZN/UneMb9zAj52tOxqv4tH7DRc1lgRsiXACZJ/TPoAUCeBDBp6gdmzQOAvAhg4tTfxwx5AJAXAUyS+vtRhU7XrQ+Y9k9Kyb7cp5H6Ew+gcQr/80+hUoT2FKcCq25xaQqFkG0BbJf6ozV3WddYKJQK6MoiBFO4IjjePopF5GwTwjB1Isi2AHwfWVul+9An4tR/ygVuVESACK2Waf/PcWRaIz+M0MIS3gsvUfzNPwXjp26NSXYF4BtkvUl43XsmqPq3IEC1OqUYKShIV/D/9mvIRhetFlJnL2dXAJGiYUT4F3e61B9Okvr70JFvtLU9vQgKP4P/yKP4334BXToAvSl99hTJpgA8A+020QffR/RrV0BUB39KF3BMY46OLAQVvG+dIHjkK2h1yc3/KSR7beB5F3R+CmyUrsLKKkiAtBsUbr8fGhuk+RrD7Angggs6t17Vs88oYIoU7nwIqTfdXUZSfG4hWwLY7lr+NJ25iyIwJbxnnsP7t+eguADhnn/tz0Sk6OjtwnbX8qdo4GMteCVko0HhjoegUEzX9u1AdgSw47X8KUABa5D1DQq33480GlDIxmVl2RBA2lN/GIL/FvzPPo7/xHehXHadQAZI0VHcgbSn/iiCYBnvv35A8JnH0MWl1Jk9g0i/AFKd+jVO/U38T38RWWu66woztJ4g3UaQZ5BGg/DWa4huuAo6zfhG6eMcYHV+wbQMI3AVfvCz+A8/iv/ci+jyAeim0/DZifQKwAh0uthf/AU6X/8bYMG1VRN/yckaU3FlIgt+Be9bTxM8/Lhz+1Jo9e5GegUAoBH684cIHjwOuuEKv3FiJ7isoUp474fQhRLoBA7idm5faSFTqT8hvQKwCoUFzMlX8b734oQf5m79Fr33VwjvvcuN3kmqHwW8IoU7/zx2+8qpN3x2Ir0CADeiykXUKzN+2hZ3U6i1VcIPXYcuLEHvNHhj7noUgamcc/vKlcwGH9IuAHCZwE44t4pCL0J+8iYTfc1B4va1t7h92cv8m6S/DZwG3QitVLFHfhnojNdGZtjtG0T+BZDcFHJ5GXv1BALIsNs3iPwLAMAYaKxDc52xdjnjbt8g8i8AIxB2sFe9Ey0tQzRiPZEDt28QMyEAiXrYI++C4tLoK4jCCIJD+J/919jtW8p01b+V/AsgifVPzzJyuZ4Tt28Q+RaAiOsAqlWXAUYpADO2tm9c8i0AgF6EVhaxV7+DkQSQsbV945J/AQjuurzWCDd+yuDavnHJtwB8g3RbhHffiC6+FXrd3QvAjK7tG5d8CwAAddcLyhC7mlO3bxD5F4BIfMHoEPN3Tt2+QeRXACLQ7mIPXkp4941Aa5tvBukjx27fIPIrgH6KAQP7t5y7fYPIuQDUBX+3OObc7RtEfgXgG6TbJvy9G9HqoZ07gBlw+waRXwEAu3YAM+L2DSLfAtitA5gRt28Q+fzauGE6gJy7fao6va+Nc18cKRuTbdI+sV0HkH+3T0WGi9duAlAgOHPmTBP0H8QVURmpkHboAPLt9ikQWGvrxtgvxI8NjNewaV3JwgriBN8gvTbh3Teh1UvP7wBmw+0rF4vFzjAvHEYAFkBETqpqG/BIe50s4kycKDr/zmH5d/vinZHvrqysdBkivkML4G1v+7nvq6o35Hv2l27oFoFc2bcGYDbcvkhEEOHl1157rYPL2gN3cNhgevV63QOej+uA9A6bZBn40pZl4LPh9vmq2gV9Jf571x0cRgAKmNdff70NPBM/ll4BwIXLwO1MuH0KGFXqV1zReDZ+bNc4DZsBQgDP08et1dPALmdX9pELloH3QAqz4PZFIhKJcOz55zeL9l33cpQuIGg2m6dVecz5AiltBy9YBh7OgtungGetjTxPj+FS/1Dz2ygFnQUwhn9XRUZ878Wjfxm4huDl1+3rw4orzl5qNBoNRujURgliBJhWq/4d0Cfjf5K+o5ksA7/6nSAGaa3n1e1LUABVXfc8vQ/ojvLmcUaxLC1VfkdVV/s3IBUkHUBtieiad0F7jcJHH8ib27eVUEQM8Jlms/kCrj4bemCOKgAL+G+88UYb+JyIeKStFjAGs3oWggWCY1/Ff+K5vLp94OIRWGvbvs8xXFYeKR7jZIAQMLVa+WFr9WnSNBUYQXoder99BPPf/0vw1/8c36o9l8FX3HFvinBbvV4fKyOPIwAF9NSpU+vLy5XbVHUDJ4L9P8pGwIboO95O8HdfQ1bXnCeQL7cvoSsiAfBIq9V4mhFTf8IkZZEHaLm8+AGQb/Z91v53ByLQ6cVnA3MZ/J6IBNbqiVqtdNupU6e6uMw88s5OWhd7QFQuL96YKhGoulvK5bPo2wx+u12/BTfqx75T0TQaowDolcuLN4A8GX+mJUunj7NDR0SKfcFPgj729DutzrhfBE+JiFHVkLkIpoXiVvmYaQYfppeqe0DQajWeEZHrVXlWRHxGsCTnbIvijq37Ckpr72+367dy7phOXHhP2xtLWkKvXK59XUSOAqhqD5cN8unFTR/FBdcTEVTtKvCRVqtxAjdolSkZcNMu1iLi7qDVqt+sqtcD34nblaRQiUiTe5gukpNsEptskbX2fs/jl+LgBzhhTO347eWITALulUqLnwb5uAgHnaIVzrUtft/rZ4n+Odzigkt8fOoi8iLoo+vr9eTcvmEPvJa9Puh9LuGBWrkcHhaRT6rqYRGpAYkYEnp7vD1pQdgUvsRLGBVV3hThmDH275vN5pvxawPG7PGH3ZC9RtjiUVer1YPWmntUdRHk90ELIlKTNH0B5B6jausgqPKfIrwM+kqrtfAfcLoZvyQ55b6nRfTFPOI77NCB2oEDsLERvhs4jEtz++8m7i1dz9PPB0HQW11drW95Lumecl0nCS61zX0CR4DLkhc9BaYh5/bbx3kf+f0kU2KuR/qcOXPmzJkzZ86cOXPmzEkV/w8y0wgRpB7N3wAAAABJRU5ErkJggolQTkcNChoKAAAADUlIRFIAAAEAAAABAAgGAAAAXHKoZgAABsFJREFUeJzt3EuO20YUBVA6yEgBvKwsOssyEE2dkZKO3N1qifV5n3MW0CDLde8rkoKPAwAAAAAAAAAAAAAAAAAAAAAAAADY4dvuC4jocvn+c/c1MMf1+sOef6P9Ygg7nUuh3Y0LPI90KoQWNyr0vKp6GZS+OcFnlKpFUO6mhJ7ZKpVBmRsRfFarUAS/7b6AEYSfHSrsu9QNVuEfgBqyngZSXrTgE1W2Ikj3CCD8RJZtf6YqgGyLS0+Z9mmK40qmBYW3oj8ShD8BCD+ZRd+/oQsg+uLBV0Tex2ELIPKiwbOi7ueQBRB1seCMiPs6XAFEXCQYJdr+DlUA0RYHZoi0z8MUQKRFgdmi7PcQBRBlMWClCPt+ewFEWATYZff+314AwD5bC2B3+0EEO3OwrQCEH/6zKw9bCkD44Vc7cuEdAC+7/v3X7kvgpOUFYPrXIPxzrM6HEwA0trQATP8aTP+5VuZkWQEIfw3Cv8aqvHgE4GWXP/7cfQmctKQATP8aTP+1VuTGCYAvEf6aFAA0Nr0AHP/zM/33mZ0fJwA+Jfy1TS0A0x/Om5kjJwA+ZPrXpwB416Pw+w1ADdMKwPEfxpmVJycAfuHo34cC4H+EvxcFAI1NKQDP/zmZ/rHNyJUTAMdxCH9XCgAaUwA8Pf39BqAOBdCco39vwwvAC0CYZ3S+nAAaM/1RANCYAmjK9Oc4FEBLws+NAoDGFEAzZ6e/3wDUogAacfTnngKAxhRAE6Y/71EADQg/H1EA0JgCKM705zMKoDDh5xEFAI0pgKJmTH8/AqpHARTk6M9XKQBoTAEUY/rzDAVQiPDzLAUAjSmAIkx/XqEAChB+XqUA+BK/AahJASRn+nOGAkhM+DlLAUBjCiAp058RFEBCws8oCgAaUwDJmP6MpAAS2RV+vwGoSwFAYwogCUd/ZlAACQg/sygAaEwBBGf6M5MCCEz4mU0BQGMKIKgo099vAGpTAAFFCT/1KQBoTAEEY/qz0rfRf/By+f5z9N/sQvjP6/DO4nr9MSy3TgCU0SH8oymAIEx/dlAAAQj/eab/axQA6Qn/6xTAZqY/OykAUjP9z1EAG5n+5wj/eQpgE+E/R/jHUADQmALYwPQ/x/QfRwEsJvznCP9YCgAaUwALmf7nmP7jKYBFhP8c4Z9DAUBjCmAB0/8c038eBTCZ8J8j/HMpAMIS/vkUwESmP9EpgEmE/xzTfw0FQDjCv44CmMD0JwsFMJjwn2P6r6UACEP411MAA5n+ZKMABhH+c0z/PRQA2wn/PgpgANP/dcK/1++7L6CCyJtYOfEZJwC2iVycXSiAwiJPf+GPQQFAYwqA5Uz/OBQASwl/LAoAGlMALGP6x6MAior2BUD4Y1IATCf8cSkAaEwBMJXpH5sCYBrhj08BQGMKoKAIXwBM/xwUAMMJfx4KABpTAAxl+ueiABhG+PNRAAwh/DkpgGIifAEgDwXAaaZ/XgqAU4Q/NwUAjSkAXmb656cACln5AlD4a1AA0JgC4Gmmfx0KgKcIfy0KgC8T/noUADSmAIqY/QXA9K9JAfCQ8NelAKAxBcCnTP/aFAAfEv76FAA0pgAKmPEFwPTvQQHwC+HvQwHwP8LfiwKAxhQA/zL9+1EAHMch/F0pgOT8N+CcoQAw/RtTAM0Jf28KABobXgDX649vo/8mc5j++YzOlxNAU8LPcSiA1F79AiD83CgAaEwBNGP689aUAvAiMCbhz21GrpwAoDEFkNSzLwBNf96jABoQfj4yrQC8B4BxZuXJCaA405/PKIDChJ9HphaAx4B9hL+OmTlyAkjIfwLCKNMLwClgPdO/jtn5cQIoRvh5hgKAxpYUgMeANUz/WlbkxgmgCOHnFcsKwClgDF8AeliVl6UnACUwh+lfy8qceARITvg5Y3kBOAWMI/z1rM6HEwA0tqUAnALOM/3r2ZGLbScAJfC82xcA4a9nVx62PgIoAdibA+8AkjH9GSnEBL5cvv/cfQ2ww+5TcIgTwO5FgB0i7PsQBXAcMRYDVomy38MUwHHEWRSYKdI+D1UAxxFrcWC0aPs7XAEcR7xFghEi7uuQBXAcMRcLXhV1P4ctgOOIu2jwjMj7OHQBHEfsxYNHou/f0Bd3zw+GyCJ68G/CnwDeyrKo9JZpn6YqgOPItbj0k21/prrYex4JiCJb8G9SXvQ9RcAuWYN/k+4R4D3Z/xHIqcK+S38D95wGmK1C8G/K3Mh7lAGjVAr9WyVv6p4i4FVVg39T+ubeowx4pHro32pzox9RCHQK/L22N/4ZpVBX57ADAAAAAAAAAAAAAAAAAAAAAAAA4fwDdMb4uK22CAwAAAAASUVORK5CYII="

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

$TimerResolutionCode = @"
using System;
using System.Runtime.InteropServices;

public class TimerResolution {
    [DllImport("ntdll.dll", SetLastError = true)]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);
}
"@
Add-Type -TypeDefinition $TimerResolutionCode -ErrorAction SilentlyContinue

$MemoryToolsCode = @"
using System;
using System.Runtime.InteropServices;

public class MemoryTools {
    [DllImport("ntdll.dll")]
    static extern int NtSetSystemInformation(int SystemInformationClass, IntPtr SystemInformation, int SystemInformationLength);

    [DllImport("advapi32.dll", SetLastError = true)]
    static extern bool OpenProcessToken(IntPtr ProcessHandle, uint DesiredAccess, out IntPtr TokenHandle);

    [DllImport("advapi32.dll", SetLastError = true)]
    static extern bool LookupPrivilegeValue(string lpSystemName, string lpName, out LUID lpLuid);

    [DllImport("advapi32.dll", SetLastError = true)]
    static extern bool AdjustTokenPrivileges(IntPtr TokenHandle, bool DisableAllPrivileges, ref TOKEN_PRIVILEGES NewState, uint BufferLength, IntPtr PreviousState, IntPtr ReturnLength);

    [DllImport("kernel32.dll")]
    static extern IntPtr GetCurrentProcess();

    [StructLayout(LayoutKind.Sequential)]
    struct LUID { public uint LowPart; public int HighPart; }

    [StructLayout(LayoutKind.Sequential)]
    struct TOKEN_PRIVILEGES { public uint PrivilegeCount; public LUID Luid; public uint Attributes; }

    const uint TOKEN_ADJUST_PRIVILEGES = 0x0020;
    const uint TOKEN_QUERY = 0x0008;
    const uint SE_PRIVILEGE_ENABLED = 0x0002;

    static bool EnablePrivilege(string privilege) {
        IntPtr hToken;
        if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, out hToken)) return false;
        LUID luid;
        if (!LookupPrivilegeValue(null, privilege, out luid)) return false;
        TOKEN_PRIVILEGES tp = new TOKEN_PRIVILEGES();
        tp.PrivilegeCount = 1;
        tp.Luid = luid;
        tp.Attributes = SE_PRIVILEGE_ENABLED;
        return AdjustTokenPrivileges(hToken, false, ref tp, 0, IntPtr.Zero, IntPtr.Zero);
    }

    public static int EmptyStandbyList() {
        if (!EnablePrivilege("SeProfileSingleProcessPrivilege")) { return -1; }
        int command = 4; // MemoryPurgeStandbyList
        IntPtr ptr = Marshal.AllocHGlobal(sizeof(int));
        Marshal.WriteInt32(ptr, command);
        int result = NtSetSystemInformation(80, ptr, sizeof(int));
        Marshal.FreeHGlobal(ptr);
        return result;
    }
}
"@
Add-Type -TypeDefinition $MemoryToolsCode -ErrorAction SilentlyContinue

# ============================================================
# DICTIONNAIRE DE TRADUCTION DE L'INTERFACE ET DES LOGS
# ============================================================
$Global:LangDict = @{
    "FR" = @{
        "Title" = "OPTI-DYLAN TOOLKIT"
        "Subtitle" = "Chaque case = une vraie action"
        "Legend" = "Blanc = sans risque`nJaune = modéré`nRouge = avancé"
        "BtnApply" = "APPLIQUER LA SELECTION"
        "BtnRestore" = "Créer un point de restauration"
        "NoOption" = "[INFO] Aucune option cochée."
        "Exec" = "[EXEC] Application de {0} option(s)..."
        "Done" = "[TERMINE] Optimisations appliquées !"
        "BoxDone" = "Optimisations appliquées. Redémarre ton PC si nécessaire."
        "CatReseau" = "Réseau & Ping"
        "CatConfidentialite" = "Confidentialité"
        "CatGaming" = "Gaming & Latence"
        "CatProcessus" = "Gestion de RAM & svchost"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Énergie & CPU"
        "CatServices" = "Services Windows"
        "CatNettoyage" = "Nettoyage & Ram"
        "CatApps" = "Applications"
        "CatBloatwares" = "Bloatwares Windows"
        "CatExtreme" = "Performance Extrême"
        "CatAudio" = "Audio & Micro"
        "CatNiveaux" = "Réducteur de Processus"
        "CatInnovations" = "Innovations"
        "InnovationsWarning" = "Ici : un démon qui bascule automatiquement le plan d'alimentation quand tu lances un jeu en plein écran, un benchmark rapide pour mesurer l'impact de tes tweaks, et des correctifs de cache. Rien de risqué, juste des idées qu'on ne trouve pas ailleurs."
        "ExtremeWarning" = "Ces réglages utilisent des techniques kernel avancées (API non documentées, fichier hosts, démon en fond). Ils sont efficaces mais réservés à ceux qui veulent aller très loin — lis bien chaque description avant de cocher."
        "QuickSelect" = "SELECTION RAPIDE"
        "BtnSelectSafe" = "Cocher Tout (Sans Risque)"
        "BtnSelectMod" = "Cocher Tout (Modéré)"
        "BtnSelectAdv" = "Cocher Tout (Avancé)"
        "BtnClearAll" = "Tout Décocher"
        "SearchPlaceholder" = "Rechercher un tweak dans cette catégorie..."
        "Cpu" = "Processeur"
        "Gpu" = "Graphismes"
        "Ram" = "Mémoire RAM"
        "RamCleanerTitle" = "NETTOYAGE RAM TEMPS RÉEL"
        "RamUsed" = "utilisé"
        "BtnCleanRam" = "Optimiser la RAM"
        "BtnSaveProfile" = "Sauvegarder Profil"
        "BtnLoadProfile" = "Charger Profil"
        "ProfileSaved" = "[OK] Profil sauvegardé avec succès dans 'opti_profile.json'."
        "ProfileLoaded" = "[OK] Profil 'opti_profile.json' chargé avec succès !"
        "ProfileErr" = "[ERR] Aucun profil sauvegardé trouvé."
        "TimerWarning" = "ATTENTION : la resolution du timer ne reste active que tant que cette fenetre OPTI-DYLAN reste ouverte. Si tu fermes le programme, Windows revient a la normale."
        # Logs
        "LogEngineOnline" = "[SYSTEM] Moteur Toolkit V15.1 En Ligne. Corrections appliquées."
        "LogCheckSafe" = "[UI] Sélection Auto : Uniquement 'Sans Risque' cochés."
        "LogCheckMod" = "[UI] Sélection Auto : 'Sans Risque' & 'Modéré' cochés."
        "LogCheckAdv" = "[UI] Sélection Auto : Absolument TOUS les tweaks cochés."
        "LogClearAll" = "[UI] Réinitialisation : Toutes les cases décochées."
        "LogRestoreStart" = "[SYSTEM] Création du point de restauration Windows..."
        "LogRestoreOk" = "[OK] Point de restauration système créé."
        "LogAutoCheck" = "[AUTO-CHECK] {0} tweak(s) déjà appliqué(s) détecté(s) et pré-coché(s)."
    }
    "EN" = @{
        "Title" = "OPTI-DYLAN TOOLKIT"
        "Subtitle" = "Every box = a real action"
        "Legend" = "White = safe`nYellow = moderate`nRed = advanced"
        "BtnApply" = "APPLY SELECTED CONFIG"
        "BtnRestore" = "Create Restore Point"
        "NoOption" = "[INFO] No options selected."
        "Exec" = "[EXEC] Applying {0} selected option(s)..."
        "Done" = "[DONE] Optimizations applied successfully!"
        "BoxDone" = "Optimizations applied. Please restart your PC if needed."
        "CatReseau" = "Network & Ping"
        "CatConfidentialite" = "Privacy"
        "CatGaming" = "Gaming & Latency"
        "CatProcessus" = "RAM & svchost Control"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Power & CPU"
        "CatServices" = "Windows Services"
        "CatNettoyage" = "Cleanup & Ram"
        "CatApps" = "Applications"
        "CatBloatwares" = "Windows Bloatwares"
        "CatExtreme" = "Extreme Performance"
        "CatAudio" = "Audio & Mic"
        "CatNiveaux" = "Process Reducer"
        "CatInnovations" = "Innovations"
        "InnovationsWarning" = "Here: a daemon that auto-switches your power plan when a game goes fullscreen, a quick benchmark to measure your tweaks' real impact, and cache fixes. Nothing risky, just ideas you won't find elsewhere."
        "ExtremeWarning" = "These tweaks use advanced kernel techniques (undocumented APIs, hosts file, background daemon). They're effective but meant for those who want to go all the way — read each description carefully before checking."
        "QuickSelect" = "QUICK SELECTION"
        "BtnSelectSafe" = "Check All (Safe Only)"
        "BtnSelectMod" = "Check All (Moderate)"
        "BtnSelectAdv" = "Check All (Advanced)"
        "BtnClearAll" = "Clear All Checkboxes"
        "SearchPlaceholder" = "Search tweaks in this category..."
        "Cpu" = "Processor"
        "Gpu" = "Graphics"
        "Ram" = "Memory RAM"
        "RamCleanerTitle" = "REAL-TIME RAM CLEANER"
        "RamUsed" = "used"
        "BtnCleanRam" = "Optimize RAM"
        "BtnSaveProfile" = "Save Profile"
        "BtnLoadProfile" = "Load Profile"
        "ProfileSaved" = "[OK] Profile saved successfully to 'opti_profile.json'."
        "ProfileLoaded" = "[OK] Profile 'opti_profile.json' loaded successfully!"
        "ProfileErr" = "[ERR] No saved profile found."
        "TimerWarning" = "WARNING: timer resolution only stays active while this OPTI-DYLAN window remains open. Closing the program reverts Windows back to normal."
        # Logs
        "LogEngineOnline" = "[SYSTEM] Toolkit Engine V15.1 Online. Fixed bugs active."
        "LogCheckSafe" = "[UI] Auto-Check: Only 'Safe' tweaks checked."
        "LogCheckMod" = "[UI] Auto-Check: 'Safe' & 'Moderate' checked."
        "LogCheckAdv" = "[UI] Checked absolutely ALL tweaks."
        "LogClearAll" = "[UI] Reset: Unchecked all boxes."
        "LogRestoreStart" = "[SYSTEM] Creating Windows Restore Point..."
        "LogRestoreOk" = "[OK] System Restore Point created successfully."
        "LogAutoCheck" = "[AUTO-CHECK] {0} already-applied tweak(s) detected and pre-checked."
    }
}
$Global:CurrentLang = "FR"

# ============================================================
# RÉCUPÉRATION INFOS PC (DIAGNOSTIC AUTOMATIQUE)
# ============================================================
$CpuName = (Get-CimInstance Win32_Processor).Name.Trim()
$GpuName = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name
$TotalRamGB = [Math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum).Sum / 1GB, 0)

# ============================================================
# FONCTIONS UTILITAIRES
# ============================================================
function Set-Reg {
    param([string]$Path, [string]$Name, $Value, [string]$Type = "DWord")
    if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
    New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Remove-Reg {
    param([string]$Path, [string]$Name)
    if (Test-Path $Path) { Remove-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue }
}

function Disable-Svc {
    param([string]$Name)
    Get-Service -Name $Name -ErrorAction SilentlyContinue | ForEach-Object {
        Stop-Service -Name $_.Name -Force -ErrorAction SilentlyContinue
        Set-Service -Name $_.Name -StartupType Disabled -ErrorAction SilentlyContinue
    }
}

function Install-WingetApp {
    param([string]$Id, [string]$AppName)
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { throw "winget introuvable." }
    if (-not (Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet -ErrorAction SilentlyContinue)) {
        throw "Pas de connexion Internet detectee, installation annulee."
    }
    Write-Log "[WINGET] Téléchargement & Installation : $AppName ($Id)..." $false
    $p = Start-Process -FilePath "winget" -ArgumentList "install --id $Id -e --silent --accept-package-agreements --accept-source-agreements" -Wait -PassThru -WindowStyle Hidden
    if ($p.ExitCode -ne 0) { throw "winget a échoué avec le code $($p.ExitCode)" }
}

function Uninstall-Appx {
    param([string]$NamePattern)
    $removed = 0
    $errors = @()

    $pkgs = Get-AppxPackage -AllUsers -Name "*$NamePattern*" -ErrorAction SilentlyContinue
    foreach ($pkg in $pkgs) {
        try { Remove-AppxPackage -Package $pkg.PackageFullName -AllUsers -ErrorAction Stop; $removed++ }
        catch { $errors += $_.Exception.Message }
    }

    $provisioned = Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -match $NamePattern }
    foreach ($prov in $provisioned) {
        try { Remove-AppxProvisionedPackage -Online -PackageName $prov.PackageName -ErrorAction Stop; $removed++ }
        catch { $errors += $_.Exception.Message }
    }

    if ($removed -eq 0 -and $errors.Count -gt 0) {
        throw "Suppression AppX échouée : $($errors[0])"
    }
    return $removed
}

function Get-Brush {
    param([string]$Hex)
    return (New-Object System.Windows.Media.BrushConverter).ConvertFromString($Hex)
}

# ==============================================================================
#  MOTEUR AUDIO NATIF (OptiDylanAudio) + FONCTIONS EQUALIZER APO / VST / RADAR
#  Rien de ceci n'existait avant : nouvelle categorie "Audio" ci-dessous.
# ==============================================================================

$OptiDylanAudioCSharp = @"
using System;
using System.Runtime.InteropServices;

public class OptiDylanAudio {
    [Guid("BCDE0359-F3E5-4A3C-B120-4B34FA7C3396"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    internal interface IMMDeviceEnumerator {
        int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice ppDevice);
    }
    [Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    internal interface IMMDevice {
        int Activate(ref Guid iid, int dwClsCtx, IntPtr pActivationParams,
            [MarshalAs(UnmanagedType.IUnknown)] out object ppInterface);
    }
    [Guid("C8ADBD64-E71E-48A0-A4DE-185C384CD43F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    internal interface IAudioMeterInformation {
        int GetPeakValue(out float pfPeak);
    }
    [ComImport, Guid("BCDE0359-F3E5-4A3C-B120-4B34FA7C3396")]
    internal class MMDeviceEnumeratorComObject { }

    public static float GetMicrophonePeakLevel() {
        try {
            var enumerator = (IMMDeviceEnumerator)new MMDeviceEnumeratorComObject();
            IMMDevice device;
            enumerator.GetDefaultAudioEndpoint(1, 0, out device); // 1 = eCapture
            Guid meterGuid = new Guid("C8ADBD64-E71E-48A0-A4DE-185C384CD43F");
            object meterObj;
            device.Activate(ref meterGuid, 1, IntPtr.Zero, out meterObj);
            var meter = (IAudioMeterInformation)meterObj;
            float peak;
            meter.GetPeakValue(out peak);
            return peak;
        } catch {
            return 0.0f;
        }
    }
}
"@
if (-not ([System.Management.Automation.PSTypeName]'OptiDylanAudio').Type) {
    try {
        Add-Type -TypeDefinition $OptiDylanAudioCSharp -ErrorAction Stop
    } catch {
        # Write-Log et $Global:LogHistory n'existent pas encore a ce point du
        # script (definis bien plus loin) : on ne peut pas s'appuyer dessus ici.
        # On garde l'erreur de cote pour l'afficher plus tard dans l'onglet Audio.
        $Global:AudioEngineError = $_.Exception.Message
        Write-Host "[OptiDylanAudio] Erreur de compilation du moteur micro : $($_.Exception.Message)" -ForegroundColor Red
    }
}

$Global:EqApoPath      = "C:\Program Files\EqualizerAPO"
$Global:EqApoConfig    = "$Global:EqApoPath\config\config.txt"
$Global:OptiVstFolder  = "C:\OptiDylan\VST"

function Test-EqualizerApoInstalled { return (Test-Path $Global:EqApoPath) }

# IMPORTANT : pas d'installation "silencieuse" ici. D'apres les tickets
# officiels du projet (sourceforge.net/p/equalizerapo/tickets/186), le setup
# NSIS lance son Configurator.exe en ExecWait, qui exige de choisir le
# peripherique audio a la main -- un vrai silent install n'existe pas pour
# ce logiciel precis, et pretendre le contraire aurait ete du theatre de
# plus. On telecharge et on lance l'installeur normalement, une seule fois.
function Install-EqualizerApoGuided {
    if (Test-EqualizerApoInstalled) { return $true }
    try {
        $url = "https://sourceforge.net/projects/equalizerapo/files/latest/download"
        $dest = "$env:TEMP\EqualizerAPO-Setup.exe"
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
        Start-Process -FilePath $dest -Wait
        return (Test-EqualizerApoInstalled)
    } catch {
        Write-Log "[ERR] Install-EqualizerApoGuided -> $($_.Exception.Message)" $false
        return $false
    }
}

# Fusionne une section balisee dans config.txt SANS ecraser les autres
# sections (corrige le bug ou VST et Radar s'effacaient mutuellement).
function Set-EqualizerApoSection {
    param([string]$SectionName, [string[]]$Lines)

    if (-not (Test-EqualizerApoInstalled)) { return $false }
    $configDir = Split-Path $Global:EqApoConfig -Parent
    if (-not (Test-Path $configDir)) { New-Item -Path $configDir -ItemType Directory -Force | Out-Null }

    $existing = @()
    if (Test-Path $Global:EqApoConfig) { $existing = @(Get-Content $Global:EqApoConfig) }

    $startTag = "# >>> OPTIDYLAN:$SectionName"
    $endTag   = "# <<< OPTIDYLAN:$SectionName"
    $kept = New-Object System.Collections.Generic.List[string]
    $skip = $false
    foreach ($line in $existing) {
        if ($line -eq $startTag) { $skip = $true; continue }
        if ($line -eq $endTag) { $skip = $false; continue }
        if (-not $skip) { [void]$kept.Add($line) }
    }

    if ($null -ne $Lines -and $Lines.Count -gt 0) {
        [void]$kept.Add($startTag)
        foreach ($l in $Lines) { [void]$kept.Add($l) }
        [void]$kept.Add($endTag)
    }

    Set-Content -Path $Global:EqApoConfig -Value $kept -Force
    return $true
}

function Set-OptiAudioVST {
    param([string]$VstPath, [bool]$Enabled)
    if ($Enabled -and (Test-Path $VstPath)) {
        return Set-EqualizerApoSection -SectionName "VST" -Lines @("Device: Microphone", "VSTPlugin: `"$VstPath`"")
    } else {
        return Set-EqualizerApoSection -SectionName "VST" -Lines @()
    }
}

function Set-OptiSoundRadar {
    param([bool]$Enabled)
    if ($Enabled) {
        return Set-EqualizerApoSection -SectionName "RADAR" -Lines @(
            "Device: Speakers Headphones",
            "Filter 1: ON PK Fc 100 Hz Gain -6.0 dB Q 1.00",
            "Filter 2: ON PK Fc 2500 Hz Gain 5.5 dB Q 1.41",
            "Filter 3: ON PK Fc 4000 Hz Gain 4.0 dB Q 1.41"
        )
    } else {
        return Set-EqualizerApoSection -SectionName "RADAR" -Lines @()
    }
}

# ------------------------------------------------------------------------
# NIVEAUX DE REDUCTION DE PROCESSUS (1 a 5, ~100 a ~50 processus). C'est un
# PRESET : il coche des options qui existent deja (Confidentialite/Services/
# Bloatwares/Processus), rien n'est duplique ni reimplemente.
# ------------------------------------------------------------------------
function Set-ProcessReductionLevel([int]$Level) {
    # On ne coche plus 122/123/124 : leurs propres Actions ecrivent la meme cle
    # de registre que le ComboBox "Optimiseur RAM" ci-dessous, et les deux
    # mecanismes qui tournaient en meme temps se marchaient dessus (source
    # probable de l'echec "operation non autorisee" vu en test). Le ComboBox
    # est le seul a piloter le seuil SvcHost desormais.
    $managedIds = @(20,27,24,16,17,61,68,69,74,63,137,62,66,67,146,64,65)
    foreach ($id in $managedIds) { $Global:CheckStates[$id] = $false }

    $svcHostValue = "380000"
    if ($Level -ge 2) { $Global:CheckStates[20]=$true; $Global:CheckStates[27]=$true; $Global:CheckStates[24]=$true }
    if ($Level -ge 3) { $Global:CheckStates[16]=$true; $svcHostValue = "8388608" }
    if ($Level -ge 4) {
        $Global:CheckStates[17]=$true; $Global:CheckStates[61]=$true
        $Global:CheckStates[68]=$true; $Global:CheckStates[69]=$true; $Global:CheckStates[74]=$true
        $svcHostValue = "16777216"
    }
    if ($Level -ge 5) {
        $Global:CheckStates[63]=$true; $Global:CheckStates[137]=$true
        $Global:CheckStates[62]=$true; $Global:CheckStates[66]=$true; $Global:CheckStates[67]=$true; $Global:CheckStates[146]=$true
        $Global:CheckStates[64]=$true; $Global:CheckStates[65]=$true
        $svcHostValue = "67108864"
    }

    $Global:SelectedSvcHostValue = $svcHostValue
    for ($i = 0; $i -lt $ComboSvcHostRam.Items.Count; $i++) {
        if ($ComboSvcHostRam.Items[$i].Tag -eq $svcHostValue) { $ComboSvcHostRam.SelectedIndex = $i; break }
    }

    # Log explicite pour diagnostiquer sans etape supplementaire au prochain test
    $checkedNow = ($managedIds | Where-Object { $Global:CheckStates[$_] -eq $true })
    $LogBox.AppendText(">> [NIVEAU $Level] SvcHost cible = $svcHostValue Ko | Options cochees = $($checkedNow -join ', ')`n")
    $LogBox.ScrollToEnd()

    Render-Category $Global:LastCategory
    Update-SidebarCounters

    # Applique VRAIMENT (pas juste une selection) : appel DIRECT de la fonction
    # d'application (plus de simulation de clic RaiseEvent, dont je ne pouvais
    # pas garantir qu'elle declenchait bien le handler PowerShell).
    Invoke-ApplyAllChecked
}

# ============================================================
# INNOVATION #2 : MINI-BENCHMARK INTÉGRÉ
# ============================================================
# Mesure rapide CPU / Disque / RAM pour voir l'impact réel des tweaks,
# avant/après. Prend quelques secondes, aucune installation externe.
function Invoke-QuickBenchmark {
    $results = [ordered]@{}

    # --- CPU : boucle de calcul, on mesure le temps pour un nombre fixe d'itérations ---
    $cpuTime = Measure-Command {
        $x = 0
        for ($i = 0; $i -lt 15000000; $i++) { $x += ($i % 7) }
    }
    $results["cpu_ms"] = [Math]::Round($cpuTime.TotalMilliseconds, 0)

    # --- Disque : écriture/lecture d'un fichier de 100 Mo dans %TEMP% ---
    $testFile = Join-Path $env:TEMP "opti_dylan_bench.tmp"
    $sizeMB = 100
    $data = New-Object byte[] ($sizeMB * 1MB)
    (New-Object Random).NextBytes($data)
    try {
        $writeTime = Measure-Command { [System.IO.File]::WriteAllBytes($testFile, $data) }
        $readTime = Measure-Command { [System.IO.File]::ReadAllBytes($testFile) | Out-Null }
        $results["write_mbs"] = [Math]::Round($sizeMB / [Math]::Max($writeTime.TotalSeconds, 0.001), 1)
        $results["read_mbs"] = [Math]::Round($sizeMB / [Math]::Max($readTime.TotalSeconds, 0.001), 1)
    } finally {
        Remove-Item $testFile -Force -ErrorAction SilentlyContinue
    }

    # --- RAM : etat actuel ---
    $os = Get-CimInstance Win32_OperatingSystem
    $results["ram_pct"] = [Math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 0)
    $results["ram_free_gb"] = [Math]::Round($os.FreePhysicalMemory / 1MB, 1)

    return $results
}

function Test-TweakApplied {
    # Verifie si un tweak est deja applique sur la machine. Ne fonctionne que
    # pour les tweaks annotes CheckType="Reg" ou CheckType="Svc" (les tweaks
    # simples a une seule cle de registre ou un seul service). Les tweaks plus
    # complexes (netsh, powercfg, winget, DISM...) ne sont pas verifiables de
    # facon fiable et restent decoches par defaut au demarrage.
    param($item)
    try {
        if ($item.CheckType -eq "Reg") {
            if (-not (Test-Path $item.CheckPath)) { return $false }
            $current = (Get-ItemProperty -Path $item.CheckPath -Name $item.CheckName -ErrorAction SilentlyContinue).$($item.CheckName)
            if ($null -eq $current) { return $false }
            return ([string]$current -eq [string]$item.CheckValue)
        } elseif ($item.CheckType -eq "Svc") {
            $svc = Get-Service -Name $item.CheckSvc -ErrorAction SilentlyContinue
            if ($null -eq $svc) { return $false }
            return ($svc.StartType -eq "Disabled")
        }
    } catch { return $false }
    return $null
}

function Set-SystemTimerResolution {
    param([double]$Milliseconds)
    $val = [uint32]($Milliseconds * 10000)
    $current = [uint32]0
    $res = [TimerResolution]::NtSetTimerResolution($val, $true, [ref]$current)
    if ($res -eq 0) {
        Write-Log "[TIMER] Résolution forcée à : $Milliseconds ms (Kernel : $($current / 10000) ms)" $false
        Write-Log "[TIMER] Rappel : ce reglage reste actif seulement tant qu'OPTI-DYLAN reste ouvert. Ferme le programme = retour a la normale." $false
    } else {
        Write-Log "[WARN] Échec de la résolution du Timer (Code: $res)" $false
    }
}

# ============================================================
# TIMER RESOLUTION PERSISTANT (installation en 1 clic)
# ============================================================
# Compile un mini .exe autonome (quelques Ko) qui ne fait qu'une chose :
# tenir la resolution du timer via NtSetTimerResolution puis dormir
# indefiniment. Enregistre comme tache planifiee au demarrage de session,
# invisible, pour que le reglage reste actif meme sans OPTI-DYLAN ouvert.
$Global:TimerTaskName = "OPTI-DYLAN-TimerResolution"
$Global:TimerInstallDir = Join-Path $env:LOCALAPPDATA "OPTI-DYLAN"
$Global:TimerExePath = Join-Path $Global:TimerInstallDir "TimerResolutionService.exe"

function Install-PersistentTimerResolution {
    param([double]$Milliseconds = 0.5)

    if (-not (Test-Path $Global:TimerInstallDir)) {
        New-Item -Path $Global:TimerInstallDir -ItemType Directory -Force | Out-Null
    }

    $csharpSource = @'
using System;
using System.Runtime.InteropServices;
using System.Threading;

public class Program {
    [DllImport("ntdll.dll")]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);

    public static void Main(string[] args) {
        uint desired = 5000;
        if (args.Length > 0) { uint.TryParse(args[0], out desired); }
        uint current;
        NtSetTimerResolution(desired, true, out current);
        while (true) { Thread.Sleep(60000); }
    }
}
'@

    # Recompile a chaque installation pour repartir d'un binaire propre.
    if (Test-Path $Global:TimerExePath) {
        Get-Process -Name "TimerResolutionService" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 300
        Remove-Item $Global:TimerExePath -Force -ErrorAction SilentlyContinue
    }

    Add-Type -TypeDefinition $csharpSource -OutputType WindowsApplication -OutputAssembly $Global:TimerExePath -ErrorAction Stop

    $val = [int]($Milliseconds * 10000)

    Unregister-ScheduledTask -TaskName $Global:TimerTaskName -Confirm:$false -ErrorAction SilentlyContinue

    $action = New-ScheduledTaskAction -Execute $Global:TimerExePath -Argument "$val"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero) -Hidden

    Register-ScheduledTask -TaskName $Global:TimerTaskName -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null

    # Lance immediatement, sans attendre la prochaine connexion Windows.
    Start-ScheduledTask -TaskName $Global:TimerTaskName
}

function Uninstall-PersistentTimerResolution {
    Unregister-ScheduledTask -TaskName $Global:TimerTaskName -Confirm:$false -ErrorAction SilentlyContinue
    Get-Process -Name "TimerResolutionService" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 300
    Remove-Item $Global:TimerExePath -Force -ErrorAction SilentlyContinue
}

function Test-PersistentTimerResolutionInstalled {
    $task = Get-ScheduledTask -TaskName $Global:TimerTaskName -ErrorAction SilentlyContinue
    return ($null -ne $task)
}

# ============================================================
# DÉMON DE PRIORITÉ DE PROCESSUS (surveille et boost le premier plan)
# ============================================================
# Compile un mini .exe qui surveille en continu quelle fenetre est au
# premier plan et met automatiquement son processus en priorite Haute,
# sauf pour une liste d'exclusion (explorer, shell, nos propres services).
# Installe via tache planifiee au demarrage de session, meme principe que
# le Timer Resolution persistant.
$Global:PrioTaskName = "OPTI-DYLAN-PriorityDaemon"
$Global:PrioInstallDir = Join-Path $env:LOCALAPPDATA "OPTI-DYLAN"
$Global:PrioExePath = Join-Path $Global:PrioInstallDir "ProcessPriorityDaemon.exe"

function Install-ProcessPriorityDaemon {
    if (-not (Test-Path $Global:PrioInstallDir)) {
        New-Item -Path $Global:PrioInstallDir -ItemType Directory -Force | Out-Null
    }

    $csharpSource = @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;

public class Program {
    [DllImport("user32.dll")]
    static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")]
    static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint processId);

    static string[] skipList = { "explorer", "SearchHost", "ShellExperienceHost", "TextInputHost", "dwm", "StartMenuExperienceHost", "TimerResolutionService", "ProcessPriorityDaemon" };

    public static void Main(string[] args) {
        int lastPid = -1;
        while (true) {
            try {
                IntPtr hWnd = GetForegroundWindow();
                uint pid;
                GetWindowThreadProcessId(hWnd, out pid);
                if (pid != 0 && (int)pid != lastPid) {
                    lastPid = (int)pid;
                    Process p = Process.GetProcessById((int)pid);
                    bool skip = false;
                    foreach (var s in skipList) {
                        if (p.ProcessName.IndexOf(s, StringComparison.OrdinalIgnoreCase) >= 0) { skip = true; break; }
                    }
                    if (!skip) {
                        try { p.PriorityClass = ProcessPriorityClass.High; } catch { }
                    }
                }
            } catch { }
            Thread.Sleep(2000);
        }
    }
}
'@

    if (Test-Path $Global:PrioExePath) {
        Get-Process -Name "ProcessPriorityDaemon" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 300
        Remove-Item $Global:PrioExePath -Force -ErrorAction SilentlyContinue
    }

    Add-Type -TypeDefinition $csharpSource -OutputType WindowsApplication -OutputAssembly $Global:PrioExePath -ErrorAction Stop

    Unregister-ScheduledTask -TaskName $Global:PrioTaskName -Confirm:$false -ErrorAction SilentlyContinue

    $action = New-ScheduledTaskAction -Execute $Global:PrioExePath
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero) -Hidden

    Register-ScheduledTask -TaskName $Global:PrioTaskName -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null
    Start-ScheduledTask -TaskName $Global:PrioTaskName
}

function Uninstall-ProcessPriorityDaemon {
    Unregister-ScheduledTask -TaskName $Global:PrioTaskName -Confirm:$false -ErrorAction SilentlyContinue
    Get-Process -Name "ProcessPriorityDaemon" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 300
    Remove-Item $Global:PrioExePath -Force -ErrorAction SilentlyContinue
}

function Test-ProcessPriorityDaemonInstalled {
    $task = Get-ScheduledTask -TaskName $Global:PrioTaskName -ErrorAction SilentlyContinue
    return ($null -ne $task)
}

# ============================================================
# INNOVATION #1 : SMART POWER SWITCHER
# ============================================================
# Démon qui détecte automatiquement quand une fenêtre passe en plein écran
# (donc probablement un jeu) et bascule le plan d'alimentation sur
# "Performances élevées" tout seul, puis revient sur "Équilibré" dès que
# tu retournes sur le bureau. Utilise les GUID standards Windows (constants
# sur toutes les machines), pas besoin de dupliquer un plan personnalisé.
$Global:SmartPowerTaskName = "OPTI-DYLAN-SmartPower"
$Global:SmartPowerInstallDir = Join-Path $env:LOCALAPPDATA "OPTI-DYLAN"
$Global:SmartPowerExePath = Join-Path $Global:SmartPowerInstallDir "SmartPowerDaemon.exe"

function Install-SmartPowerDaemon {
    if (-not (Test-Path $Global:SmartPowerInstallDir)) {
        New-Item -Path $Global:SmartPowerInstallDir -ItemType Directory -Force | Out-Null
    }

    $csharpSource = @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;

public class Program {
    [DllImport("user32.dll")] static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")] static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
    [DllImport("user32.dll")] static extern int GetSystemMetrics(int nIndex);

    [StructLayout(LayoutKind.Sequential)]
    struct RECT { public int Left, Top, Right, Bottom; }

    const string SCHEME_BALANCED = "381b4222-f694-41f0-9685-ff5bb260df2e";
    const string SCHEME_HIGHPERF = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c";
    static bool weSwitched = false;

    static void SetScheme(string guid) {
        try {
            var psi = new ProcessStartInfo("powercfg.exe", "/setactive " + guid);
            psi.CreateNoWindow = true;
            psi.UseShellExecute = false;
            psi.WindowStyle = ProcessWindowStyle.Hidden;
            using (var p = Process.Start(psi)) { p.WaitForExit(); }
        } catch { }
    }

    static bool IsForegroundFullscreen() {
        try {
            IntPtr hWnd = GetForegroundWindow();
            if (hWnd == IntPtr.Zero) return false;
            RECT r;
            if (!GetWindowRect(hWnd, out r)) return false;
            int screenW = GetSystemMetrics(0);
            int screenH = GetSystemMetrics(1);
            int w = r.Right - r.Left;
            int h = r.Bottom - r.Top;
            return (w >= screenW && h >= screenH);
        } catch { return false; }
    }

    public static void Main(string[] args) {
        while (true) {
            bool fs = IsForegroundFullscreen();
            if (fs && !weSwitched) {
                SetScheme(SCHEME_HIGHPERF);
                weSwitched = true;
            } else if (!fs && weSwitched) {
                SetScheme(SCHEME_BALANCED);
                weSwitched = false;
            }
            Thread.Sleep(3000);
        }
    }
}
'@

    if (Test-Path $Global:SmartPowerExePath) {
        Get-Process -Name "SmartPowerDaemon" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 300
        Remove-Item $Global:SmartPowerExePath -Force -ErrorAction SilentlyContinue
    }

    Add-Type -TypeDefinition $csharpSource -OutputType WindowsApplication -OutputAssembly $Global:SmartPowerExePath -ErrorAction Stop

    Unregister-ScheduledTask -TaskName $Global:SmartPowerTaskName -Confirm:$false -ErrorAction SilentlyContinue

    $action = New-ScheduledTaskAction -Execute $Global:SmartPowerExePath
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero) -Hidden

    Register-ScheduledTask -TaskName $Global:SmartPowerTaskName -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null
    Start-ScheduledTask -TaskName $Global:SmartPowerTaskName
}

function Uninstall-SmartPowerDaemon {
    Unregister-ScheduledTask -TaskName $Global:SmartPowerTaskName -Confirm:$false -ErrorAction SilentlyContinue
    Get-Process -Name "SmartPowerDaemon" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 300
    Remove-Item $Global:SmartPowerExePath -Force -ErrorAction SilentlyContinue
}

function Test-SmartPowerDaemonInstalled {
    $task = Get-ScheduledTask -TaskName $Global:SmartPowerTaskName -ErrorAction SilentlyContinue
    return ($null -ne $task)
}

# ============================================================
# RACCOURCI BUREAU (appli lançable en 1 double-clic, icône dédiée)
# ============================================================
# Copie le script vers un emplacement fixe + cree un .lnk sur le Bureau
# qui lance PowerShell en mode cache (aucune console visible), avec
# l'icone integree ci-dessus. C'est un vrai raccourci Windows, pas un
# .exe compile, mais l'experience utilisateur est identique : double-clic,
# icone dediee, pas de fenetre noire qui clignote.
$Global:AppInstallDir = Join-Path $env:LOCALAPPDATA "OPTI-DYLAN"
$Global:AppScriptPath = Join-Path $Global:AppInstallDir "OPTI-DYLAN.ps1"
$Global:AppIconPath = Join-Path $Global:AppInstallDir "icon.ico"

function Install-DesktopShortcut {
    if (-not (Test-Path $Global:AppInstallDir)) {
        New-Item -Path $Global:AppInstallDir -ItemType Directory -Force | Out-Null
    }

    $iconBytes = [Convert]::FromBase64String($Global:IconBase64)
    [System.IO.File]::WriteAllBytes($Global:AppIconPath, $iconBytes)

    if ($PSCommandPath) {
        Copy-Item -Path $PSCommandPath -Destination $Global:AppScriptPath -Force
    } elseif (-not (Test-Path $Global:AppScriptPath)) {
        throw "Impossible de localiser le fichier du script. Lance OPTI-DYLAN depuis un .ps1 enregistré sur ton disque (pas via une commande en ligne) avant de créer le raccourci."
    }

    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktopPath "OPTI-DYLAN.lnk"
    $wsh = New-Object -ComObject WScript.Shell
    $shortcut = $wsh.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = "powershell.exe"
    $shortcut.Arguments = "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$Global:AppScriptPath`""
    $shortcut.IconLocation = $Global:AppIconPath
    $shortcut.WorkingDirectory = $Global:AppInstallDir
    $shortcut.Description = "OPTI-DYLAN Toolkit"
    $shortcut.Save()
}

function Uninstall-DesktopShortcut {
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktopPath "OPTI-DYLAN.lnk"
    Remove-Item $shortcutPath -Force -ErrorAction SilentlyContinue
}

function Test-DesktopShortcutInstalled {
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktopPath "OPTI-DYLAN.lnk"
    return (Test-Path $shortcutPath)
}

# ============================================================
# SERVICE TIMER RESOLUTION PERSISTANT (survit à la fermeture de
# OPTI-DYLAN et aux redémarrages, via une tâche planifiée)
# ============================================================
$Global:TimerTaskName = "OPTI-DYLAN-TimerResolution"
$Global:TimerServiceDir = Join-Path $env:LOCALAPPDATA "OPTI-DYLAN"
$Global:TimerServiceScript = Join-Path $Global:TimerServiceDir "TimerResService.ps1"

function Install-TimerResolutionService {
    param([double]$Ms)
    if (-not (Test-Path $Global:TimerServiceDir)) { New-Item -Path $Global:TimerServiceDir -ItemType Directory -Force | Out-Null }

    # Petit script autonome : applique la resolution puis la reaffirme
    # toutes les 60s (certains pilotes/apps la reinitialisent), en boucle
    # infinie invisible. C'est LUI qui tourne en fond, pas OPTI-DYLAN.
    $ServiceContent = @"
param([double]`$Ms = $Ms)
`$code = @'
using System;
using System.Runtime.InteropServices;
public class TimerResolution {
    [DllImport("ntdll.dll", SetLastError = true)]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);
}
'@
Add-Type -TypeDefinition `$code -ErrorAction SilentlyContinue
`$val = [uint32](`$Ms * 10000)
`$cur = [uint32]0
while (`$true) {
    [TimerResolution]::NtSetTimerResolution(`$val, `$true, [ref]`$cur) | Out-Null
    Start-Sleep -Seconds 60
}
"@
    [System.IO.File]::WriteAllText($Global:TimerServiceScript, $ServiceContent)

    # Retire une eventuelle ancienne tache avant de recreer (permet de
    # changer la valeur en ms sans laisser deux taches actives).
    Unregister-ScheduledTask -TaskName $Global:TimerTaskName -Confirm:$false -ErrorAction SilentlyContinue

    $Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$($Global:TimerServiceScript)`""
    $Trigger = New-ScheduledTaskTrigger -AtLogOn
    $Principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest -LogonType Interactive
    $Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBattery -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero) -Hidden
    Register-ScheduledTask -TaskName $Global:TimerTaskName -Action $Action -Trigger $Trigger -Principal $Principal -Settings $Settings -Force | Out-Null

    # Le lance aussi tout de suite (pas besoin d'attendre la prochaine connexion)
    Start-Process "powershell.exe" -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$($Global:TimerServiceScript)`"" -WindowStyle Hidden
}

function Uninstall-TimerResolutionService {
    Unregister-ScheduledTask -TaskName $Global:TimerTaskName -Confirm:$false -ErrorAction SilentlyContinue
    Get-CimInstance Win32_Process -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -match "TimerResService\.ps1" } | ForEach-Object {
        Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue
    }
}

function Test-TimerResolutionServiceInstalled {
    return $null -ne (Get-ScheduledTask -TaskName $Global:TimerTaskName -ErrorAction SilentlyContinue)
}

# ============================================================
# CATALOGUE DES TWEAKS (V15.1)
# ============================================================
$Options = @()

# --- 1. RÉSEAU & PING ---
$Options += [PSCustomObject]@{Id=1;  Cat="Reseau"; LabelFR="Désactiver l'algorithme de Nagle (TCPNoDelay)"; LabelEN="Disable Nagle's Algorithm (TCPNoDelay)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"; CheckName="TCPNoDelay"; CheckValue=1; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TCPNoDelay" 1 }}
$Options += [PSCustomObject]@{Id=2;  Cat="Reseau"; LabelFR="Forcer TcpAckFrequency à 1 (réduction ping)"; LabelEN="Force TcpAckFrequency to 1 (reduce ping)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"; CheckName="TcpAckFrequency"; CheckValue=1; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpAckFrequency" 1 }}
$Options += [PSCustomObject]@{Id=3;  Cat="Reseau"; LabelFR="Lever la limitation réseau multimédia (NetworkThrottlingIndex)"; LabelEN="Disable network throttling for multimedia streaming"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"; CheckName="NetworkThrottlingIndex"; CheckValue=0xffffffff; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 0xffffffff }}
$Options += [PSCustomObject]@{Id=4;  Cat="Reseau"; LabelFR="Vider et réinitialiser le cache DNS"; LabelEN="Flush and reset DNS client cache"; Risk="safe"; Action={ Clear-DnsClientCache -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=5;  Cat="Reseau"; LabelFR="Désactiver Large Send Offload (LSO) pour éviter les drops"; LabelEN="Disable Large Send Offload (LSO) to prevent packet drops"; Risk="moderate"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"; CheckName="DisableTaskOffload"; CheckValue=1; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "DisableTaskOffload" 1 }}
$Options += [PSCustomObject]@{Id=6;  Cat="Reseau"; LabelFR="Réinitialiser la pile réseau Winsock"; LabelEN="Reset Winsock catalog & network stack"; Risk="moderate"; Action={ netsh winsock reset | Out-Null }}
$Options += [PSCustomObject]@{Id=7;  Cat="Reseau"; LabelFR="Désactiver IPv6 (si non supporté par ta box)"; LabelEN="Disable IPv6 bindings (if unsupported)"; Risk="moderate"; Action={ Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=8;  Cat="Reseau"; LabelFR="Réduire le délai TIME_WAIT des connexions TCP (TcpTimedWaitDelay)"; LabelEN="Reduce TCP TIME_WAIT socket delay (TcpTimedWaitDelay)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"; CheckName="TcpTimedWaitDelay"; CheckValue=30; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpTimedWaitDelay" 30 }}
$Options += [PSCustomObject]@{Id=10; Cat="Reseau"; LabelFR="Activer le fournisseur de congestion CTCP (meilleur débit)"; LabelEN="Enable Compound TCP congestion provider (better throughput)"; Risk="safe"; Action={ netsh int tcp set supplemental template=internet congestionprovider=ctcp | Out-Null }}
$Options += [PSCustomObject]@{Id=11; Cat="Reseau"; LabelFR="Désactiver les TCP Timestamps (réduit l'overhead paquet)"; LabelEN="Disable TCP Timestamps (reduces per-packet overhead)"; Risk="safe"; Action={ netsh int tcp set global timestamps=disabled | Out-Null }}
$Options += [PSCustomObject]@{Id=12; Cat="Reseau"; LabelFR="Désactiver l'Heuristique de Fenêtre TCP Windows"; LabelEN="Disable Windows TCP Window Heuristics"; Risk="safe"; Action={ netsh int tcp set heuristics disabled | Out-Null }}
$Options += [PSCustomObject]@{Id=13; Cat="Reseau"; LabelFR="Configurer l'Auto-Tuning TCP sur Normal"; LabelEN="Set TCP Auto-Tuning Level to Normal"; Risk="safe"; Action={ netsh int tcp set global autotuninglevel=normal | Out-Null }}
$Options += [PSCustomObject]@{Id=14; Cat="Reseau"; LabelFR="Activer RSS (Receive Side Scaling)"; LabelEN="Enable RSS (Receive Side Scaling)"; Risk="safe"; Action={ netsh int tcp set global rss=enabled | Out-Null }}
$Options += [PSCustomObject]@{Id=15; Cat="Reseau"; LabelFR="Désactiver l'économie d'énergie de la carte réseau"; LabelEN="Disable network adapter Energy Efficient Ethernet"; Risk="moderate"; Action={ Get-NetAdapter | Set-NetAdapterAdvancedProperty -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=148; Cat="Reseau"; LabelFR="Détecter et optimiser automatiquement la carte réseau active (au lieu de toutes les cartes)"; LabelEN="Auto-detect and optimize only the active network adapter (instead of all adapters)"; Risk="safe"; Action={
    $Adapter = Get-NetAdapter -ErrorAction SilentlyContinue | Where-Object { $_.Status -eq 'Up' } | Select-Object -First 1
    if ($null -eq $Adapter) { throw "Aucune carte reseau active detectee." }
    Set-NetAdapterAdvancedProperty -Name $Adapter.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
    Set-NetAdapterAdvancedProperty -Name $Adapter.Name -DisplayName "Interrupt Moderation" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
    Set-NetAdapterRss -Name $Adapter.Name -Enabled $true -ErrorAction SilentlyContinue
}}

# --- 2. CONFIDENTIALITÉ & TÉLÉMÉTRIE ---
$Options += [PSCustomObject]@{Id=16; Cat="Confidentialite"; LabelFR="Désactiver DiagTrack (Expériences utilisateurs connectés)"; LabelEN="Disable DiagTrack (Connected User Experiences and Telemetry)"; Risk="safe"; CheckType="Svc"; CheckSvc="DiagTrack"; Action={ Disable-Svc "DiagTrack" }}
$Options += [PSCustomObject]@{Id=17; Cat="Confidentialite"; LabelFR="Désactiver dmwappushservice (Mouchards)"; LabelEN="Disable dmwappushservice routing service (Spyware)"; Risk="safe"; CheckType="Svc"; CheckSvc="dmwappushservice"; Action={ Disable-Svc "dmwappushservice" }}
$Options += [PSCustomObject]@{Id=18; Cat="Confidentialite"; LabelFR="Désactiver Delivery Optimization (Partage P2P)"; LabelEN="Disable Delivery Optimization (P2P Windows Update sharing)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"; CheckName="DODownloadMode"; CheckValue=0; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" "DODownloadMode" 0 }}
$Options += [PSCustomObject]@{Id=19; Cat="Confidentialite"; LabelFR="Couper l'ID de publicité ciblé Windows"; LabelEN="Disable Windows targeted advertising ID track"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo"; CheckName="Enabled"; CheckValue=0; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 }}
$Options += [PSCustomObject]@{Id=20; Cat="Confidentialite"; LabelFR="Empêcher les applications Store de tourner en fond"; LabelEN="Disable Windows Store background app processing"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"; CheckName="LetAppsRunInBackground"; CheckValue=2; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsRunInBackground" 2 }}
$Options += [PSCustomObject]@{Id=21; Cat="Confidentialite"; LabelFR="Désactiver la recherche Bing dans le menu Démarrer"; LabelEN="Disable Bing search queries integration in Start Menu"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"; CheckName="BingSearchEnabled"; CheckValue=0; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0 }}
$Options += [PSCustomObject]@{Id=22; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie NVIDIA (si GPU NVIDIA)"; LabelEN="Disable NVIDIA telemetry background services container"; Risk="safe"; CheckType="Svc"; CheckSvc="NvTelemetryContainer"; Action={ Disable-Svc "NvTelemetryContainer" }}
$Options += [PSCustomObject]@{Id=23; Cat="Confidentialite"; LabelFR="Désactiver l'enregistreur de pas (PSR)"; LabelEN="Disable Problem Steps Recorder (PSR)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"; CheckName="DisableUAR"; CheckValue=1; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableUAR" 1 }}
$Options += [PSCustomObject]@{Id=24; Cat="Confidentialite"; LabelFR="Retirer Cortana du démarrage"; LabelEN="Remove Cortana assistant from automatic startup"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"; CheckName="AllowCortana"; CheckValue=0; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "AllowCortana" 0 }}
$Options += [PSCustomObject]@{Id=25; Cat="Confidentialite"; LabelFR="Désactiver la collecte d'écriture manuscrite"; LabelEN="Disable handwriting & speech telemetry collection"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\SOFTWARE\Microsoft\InputPersonalization"; CheckName="RestrictImplicitSpeechCollection"; CheckValue=1; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\InputPersonalization" "RestrictImplicitSpeechCollection" 1 }}
$Options += [PSCustomObject]@{Id=26; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie de Microsoft Office"; LabelEN="Disable Microsoft Office client telemetry tracking"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\SOFTWARE\Policies\Microsoft\office\common\clienttelemetry"; CheckName="sendtelemetry"; CheckValue=0; Action={ Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\office\common\clienttelemetry" "sendtelemetry" 0 }}
$Options += [PSCustomObject]@{Id=27; Cat="Confidentialite"; LabelFR="Retirer OneDrive du démarrage automatique"; LabelEN="Remove Microsoft OneDrive from startup list"; Risk="moderate"; Action={ Remove-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "OneDrive" }}
$Options += [PSCustomObject]@{Id=28; Cat="Confidentialite"; LabelFR="Désactiver le feedback Windows (demande d'avis)"; LabelEN="Disable Windows Feedback notification prompts"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\SOFTWARE\Microsoft\Siuf\Rules"; CheckName="PeriodInNanoSeconds"; CheckValue=0; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" "PeriodInNanoSeconds" 0 }}
$Options += [PSCustomObject]@{Id=29; Cat="Confidentialite"; LabelFR="Désactiver le suivi des lancements d'applications"; LabelEN="Disable app launch tracking in Windows Explorer"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; CheckName="Start_TrackProgs"; CheckValue=0; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Start_TrackProgs" 0 }}
$Options += [PSCustomObject]@{Id=30; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie Visual Studio / VS Code"; LabelEN="Disable system environment telemetry for VS Code"; Risk="safe"; Action={ [Environment]::SetEnvironmentVariable("TELEMETRY_DISABLED", "1", "Machine") }}
$Options += [PSCustomObject]@{Id=140; Cat="Confidentialite"; LabelFR="Désactiver l'historique d'activités (Timeline)"; LabelEN="Disable Activity History / Timeline tracking"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "EnableActivityFeed" 0; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" 0; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "UploadUserActivities" 0 }}
$Options += [PSCustomObject]@{Id=141; Cat="Confidentialite"; LabelFR="Désactiver les suggestions et publicités du menu Démarrer"; LabelEN="Disable Start Menu suggestions and ads"; Risk="safe"; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338388Enabled" 0; Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SystemPaneSuggestionsEnabled" 0 }}

# --- 3. GAMING & LATENCE ---
$Options += [PSCustomObject]@{Id=31; Cat="Gaming"; LabelFR="Désactiver Game DVR & Enregistrement en arrière-plan"; LabelEN="Disable Xbox Game DVR & Background Recording"; Risk="safe"; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0; Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_FSEBehaviorMode" 2 }}
$Options += [PSCustomObject]@{Id=32; Cat="Gaming"; LabelFR="Activer le GPU Scheduling matériel (HAGS)"; LabelEN="Enable Hardware-Accelerated GPU Scheduling (HAGS)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"; CheckName="HwSchMode"; CheckValue=2; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" 2 }}
$Options += [PSCustomObject]@{Id=33; Cat="Gaming"; LabelFR="Priorité MMCSS maximale pour les jeux"; LabelEN="Set MMCSS high priority tasks profile for Games"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "GPU Priority" 8 }}
$Options += [PSCustomObject]@{Id=34; Cat="Gaming"; LabelFR="Ajuster Win32PrioritySeparation (Perf processeur)"; LabelEN="Optimize Win32PrioritySeparation (CPU core focus)"; Risk="moderate"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl"; CheckName="Win32PrioritySeparation"; CheckValue=38; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" "Win32PrioritySeparation" 38 }}
$Options += [PSCustomObject]@{Id=35; Cat="Gaming"; LabelFR="Augmenter TdrDelay (Stabilité GPU)"; LabelEN="Increase TdrDelay (Prevent random graphics driver resets)"; Risk="moderate"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"; CheckName="TdrDelay"; CheckValue=8; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "TdrDelay" 8 }}
$Options += [PSCustomObject]@{Id=36; Cat="Gaming"; LabelFR="Désactiver l'accélération de la souris (1:1 RAW Input, courbes linéaires incluses)"; LabelEN="Disable Enhance Pointer Precision (1:1 RAW mouse input, linear curves included)"; Risk="moderate"; CheckType="Reg"; CheckPath="HKCU:\Control Panel\Mouse"; CheckName="MouseSpeed"; CheckValue="0"; Action={
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" "0" "String"
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold1" "0" "String"
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold2" "0" "String"
    $sx = [byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xCC,0x0C,0x00,0x00,0x00,0x00,0x00,0x80,0x99,0x19,0x00,0x00,0x00,0x00,0x00,0x40,0x66,0x26,0x00,0x00,0x00,0x00,0x00,0x00,0x33,0x33,0x00,0x00,0x00,0x00,0x00)
    $sy = [byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xA8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0x00,0x00,0x00,0x00,0x00)
    New-Item -Path "HKCU:\Control Panel\Mouse" -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "SmoothMouseXCurve" -Value $sx -Type Binary -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "SmoothMouseYCurve" -Value $sy -Type Binary -Force -ErrorAction SilentlyContinue
}}
$Options += [PSCustomObject]@{Id=37; Cat="Gaming"; LabelFR="Désactiver l'optimisation globale du plein écran (FSE)"; LabelEN="Disable Fullscreen Optimizations globally (Fix FSE lag)"; Risk="moderate"; CheckType="Reg"; CheckPath="HKCU:\System\GameConfigStore"; CheckName="GameDVR_DSEBehavior"; CheckValue=2; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_DSEBehavior" 2 }}
$Options += [PSCustomObject]@{Id=38; Cat="Gaming"; LabelFR="Accélérer l'affichage des menus (MenuShowDelay à 0)"; LabelEN="Set MenuShowDelay to 0 (Instant desktop UI responsiveness)"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\Control Panel\Desktop"; CheckName="MenuShowDelay"; CheckValue="0"; Action={ Set-Reg "HKCU:\Control Panel\Desktop" "MenuShowDelay" "0" "String" }}
$Options += [PSCustomObject]@{Id=39; Cat="Gaming"; LabelFR="Désactiver les saccades dues au GameMode"; LabelEN="Disable automatic background stutter linked to GameMode"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\Software\Microsoft\GameBar"; CheckName="AllowAutoGameMode"; CheckValue=0; Action={ Set-Reg "HKCU:\Software\Microsoft\GameBar" "AllowAutoGameMode" 0 }}
$Options += [PSCustomObject]@{Id=40; Cat="Gaming"; LabelFR="Désactiver la mise en veille de l'écran pendant le jeu"; LabelEN="Disable screen timeout sleep cycles during gaming sessions"; Risk="safe"; Action={ powercfg /change monitor-timeout-ac 0 }}
$Options += [PSCustomObject]@{Id=41; Cat="Gaming"; LabelFR="Ajuster les effets visuels pour la performance"; LabelEN="Adjust Windows Visual Effects styling for raw performance"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"; CheckName="VisualFXSetting"; CheckValue=2; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" "VisualFXSetting" 2 }}
$Options += [PSCustomObject]@{Id=42; Cat="Gaming"; LabelFR="Optimiser le rafraîchissement multimédia"; LabelEN="Optimize high multimedia task scheduling categories"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"; CheckName="Scheduling Category"; CheckValue="High"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "Scheduling Category" "High" "String" }}
$Options += [PSCustomObject]@{Id=43; Cat="Gaming"; LabelFR="Augmenter la priorité I/O disque pour les jeux"; LabelEN="Increase I/O disk priorities allocation (NTFS cache lookup)"; Risk="moderate"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem"; CheckName="NtfsMemoryUsage"; CheckValue=2; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" "NtfsMemoryUsage" 2 }}
$Options += [PSCustomObject]@{Id=44; Cat="Gaming"; LabelFR="Désactiver l'alerte de raccourci des touches rémanentes"; LabelEN="Disable Sticky Keys annoying trigger shortcut popups"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\Control Panel\Accessibility\StickyKeys"; CheckName="Flags"; CheckValue="506"; Action={ Set-Reg "HKCU:\Control Panel\Accessibility\StickyKeys" "Flags" "506" "String" }}
$Options += [PSCustomObject]@{Id=142; Cat="Gaming"; LabelFR="Empêcher le redémarrage forcé après une mise à jour"; LabelEN="Prevent forced auto-restart after Windows Update while logged in"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"; CheckName="NoAutoRebootWithLoggedOnUsers"; CheckValue=1; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" "NoAutoRebootWithLoggedOnUsers" 1 }}

# --- 4. GESTION DE RAM & SVCHOST (systeme a 3 niveaux) ---
$Options += [PSCustomObject]@{Id=122; Cat="Processus"; LabelFR="[NIVEAU 1 - BASIQUE] Regroupement leger des svchost.exe (seuil 3.8 Go)"; LabelEN="[LEVEL 1 - BASIC] Light svchost.exe grouping (3.8 GB threshold)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control"; CheckName="SvcHostSplitThresholdInKB"; CheckValue=3984588; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 3984588 }}
$Options += [PSCustomObject]@{Id=123; Cat="Processus"; LabelFR="[NIVEAU 2 - OPTIMISE] Regroupement agressif (seuil 16 Go) + coupe telemetrie/diagnostic"; LabelEN="[LEVEL 2 - OPTIMIZED] Aggressive grouping (16 GB threshold) + disable telemetry/diagnostics"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 16777216; Disable-Svc "DiagTrack"; Disable-Svc "dmwappushservice"; Disable-Svc "WerSvc" }}
$Options += [PSCustomObject]@{Id=124; Cat="Processus"; LabelFR="[NIVEAU 3 - EXTREME] Regroupement total (seuil 128 Go) + gel des services secondaires + coupe Widgets"; LabelEN="[LEVEL 3 - EXTREME] Total grouping (128 GB threshold) + freeze secondary services + disable Widgets"; Risk="advanced"; Action={
    $failedParts = @()
    try { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 134217728 } catch { $failedParts += "SvcHost ($($_.Exception.Message))" }
    foreach ($svcName in @("DiagTrack","dmwappushservice","WerSvc","SysMain","WSearch","PcaSvc","MapsBroker","lfsvc","RemoteRegistry","Fax","WidgetsService")) {
        try { Disable-Svc $svcName } catch { $failedParts += "$svcName ($($_.Exception.Message))" }
    }
    try { Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" 0 } catch { $failedParts += "TaskbarDa ($($_.Exception.Message))" }
    try { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" "AllowNewsAndInterests" 0 } catch { $failedParts += "Widgets ($($_.Exception.Message))" }
    if ($failedParts.Count -gt 0) { throw "Applique partiellement, echec sur : $($failedParts -join ' | ')" }
}}

# --- 5. TIMER RESOLUTION ---
$Options += [PSCustomObject]@{Id=115; Cat="Timer"; LabelFR="0.45 ms - Latence Expérimentale (Forçage limite bas)"; LabelEN="0.45 ms - Experimental Latency (Force strict hardware floor)"; Risk="advanced"; Action={ Set-SystemTimerResolution 0.45 }}
$Options += [PSCustomObject]@{Id=116; Cat="Timer"; LabelFR="0.50 ms - Latence Minimale Absolue (Gaming Compétitif)"; LabelEN="0.50 ms - Minimum Latency standard (Competitive Gaming)"; Risk="safe"; Action={ Set-SystemTimerResolution 0.50 }}
$Options += [PSCustomObject]@{Id=117; Cat="Timer"; LabelFR="0.60 ms - Latence Très Basse (Ultra stable)"; LabelEN="0.60 ms - Ultra Stable Low Latency profile"; Risk="safe"; Action={ Set-SystemTimerResolution 0.60 }}
$Options += [PSCustomObject]@{Id=118; Cat="Timer"; LabelFR="0.75 ms - Latence Intermédiaire Optimisée"; LabelEN="0.75 ms - Balanced Hybrid Optimized Latency"; Risk="safe"; Action={ Set-SystemTimerResolution 0.75 }}
$Options += [PSCustomObject]@{Id=119; Cat="Timer"; LabelFR="1.00 ms - Latence Standard Windows Équilibrée"; LabelEN="1.00 ms - Default Balanced Windows OS timer tick rate"; Risk="safe"; Action={ Set-SystemTimerResolution 1.00 }}

# --- 6. ÉNERGIE & PROCESSEUR ---
$Options += [PSCustomObject]@{Id=46; Cat="Power"; LabelFR="Activer le plan d'alimentation Performances Ultimes"; LabelEN="Unlock and apply Ultimate Performance power scheme"; Risk="safe"; Action={
    $out = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    if ($out -match '([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})') {
        powercfg /setactive $Matches[1]
    } else {
        throw "Impossible d'extraire le GUID du plan cree (sortie powercfg: $out)"
    }
}}
$Options += [PSCustomObject]@{Id=47; Cat="Power"; LabelFR="Désactiver le Core Parking (C-States bloqués)"; LabelEN="Disable CPU Core Parking (Locks minimum active logical cores)"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100 }}
$Options += [PSCustomObject]@{Id=48; Cat="Power"; LabelFR="Désactiver le Power Throttling"; LabelEN="Disable Global Windows Power Throttling engines"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Power\PowerThrottling"; CheckName="PowerThrottlingOff"; CheckValue=1; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Power\PowerThrottling" "PowerThrottlingOff" 1 }}
$Options += [PSCustomObject]@{Id=49; Cat="Power"; LabelFR="Forcer l'état minimal du processeur à 100%"; LabelEN="Force Minimum Processor State to 100% on AC power"; Risk="moderate"; Action={ powercfg /setacvalueindex scheme_current sub_processor 893dee8e-2bef-41e0-89c6-b55d0929964c 100 }}
$Options += [PSCustomObject]@{Id=50; Cat="Power"; LabelFR="Désactiver la suspension sélective USB"; LabelEN="Disable USB selective suspend settings tasks profiling"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 }}
$Options += [PSCustomObject]@{Id=51; Cat="Power"; LabelFR="Désactiver HPET (High Precision Event Timer)"; LabelEN="Disable High Precision Event Timer (HPET) ticks"; Risk="advanced"; Action={ bcdedit /deletevalue useplatformclock; bcdedit /set disabledynamictick yes }}
$Options += [PSCustomObject]@{Id=52; Cat="Power"; LabelFR="Désactiver les mitigations Spectre/Meltdown (gain FPS)"; LabelEN="Disable Spectre/Meltdown hardware mitigations (FPS Boost)"; Risk="advanced"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverride" 3; Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverrideMask" 3 }}
$Options += [PSCustomObject]@{Id=53; Cat="Power"; LabelFR="Désactiver le démarrage rapide (Fast Startup)"; LabelEN="Disable Windows Fast Startup (Prevents random kernel bugs)"; Risk="safe"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"; CheckName="HiberbootEnabled"; CheckValue=0; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" "HiberbootEnabled" 0 }}
$Options += [PSCustomObject]@{Id=54; Cat="Power"; LabelFR="Désactiver l'hibernation (libère de l'espace)"; LabelEN="Disable Hibernation system file (Deletes hiberfil.sys storage)"; Risk="safe"; Action={ powercfg /h off }}
$Options += [PSCustomObject]@{Id=57; Cat="Power"; LabelFR="Désactiver le Link State Power Management (PCIe max)"; LabelEN="Turn off PCIe Link State Power Management (Max bandwidth)"; Risk="moderate"; Action={
    $out = powercfg /setacvalueindex scheme_current sub_pciexpress ee12f20e-c558-4753-b6d2-85978a506a59 0 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Reglage non disponible sur ce materiel/chipset (normal sur certaines configs) : $out"
    }
}}

# --- 7. SERVICES WINDOWS INUTILES ---
$Options += [PSCustomObject]@{Id=61; Cat="Services"; LabelFR="Désactiver SysMain / Superfetch (HDD obsolète)"; LabelEN="Disable SysMain / Superfetch service (Heavy background disk use)"; Risk="moderate"; CheckType="Svc"; CheckSvc="SysMain"; Action={ Disable-Svc "SysMain" }}
$Options += [PSCustomObject]@{Id=62; Cat="Services"; LabelFR="Désactiver Windows Search (Indexation en tâche de fond)"; LabelEN="Disable Windows Search (Stops continuous file indexing)"; Risk="moderate"; CheckType="Svc"; CheckSvc="WSearch"; Action={ Disable-Svc "WSearch" }}
$Options += [PSCustomObject]@{Id=63; Cat="Services"; LabelFR="Désactiver la suite complète des Services Xbox"; LabelEN="Disable complete suite of core background Xbox ecosystem services"; Risk="moderate"; Action={ "XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc" | ForEach-Object { Disable-Svc $_ } }}
$Options += [PSCustomObject]@{Id=64; Cat="Services"; LabelFR="Désactiver Bluetooth Support Service (si inutilisé)"; LabelEN="Disable Bluetooth Support Service (If wireless devices aren't used)"; Risk="moderate"; CheckType="Svc"; CheckSvc="bthserv"; Action={ Disable-Svc "bthserv" }}
# --- Ajouts issus de ReviOS (registre confidentialite/telemetrie, non couverts) ---
$Options += [PSCustomObject]@{Id=166; Cat="Confidentialite"; LabelFR="Télémétrie approfondie (strategies de groupe AllowTelemetry, flighting, diagnostics)"; LabelEN="Deep telemetry policy (AllowTelemetry group policies, flighting, diagnostics)"; Risk="moderate"; Action={
    Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" "AllowTelemetry" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowCommercialDataPipeline" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowDeviceNameInTelemetry" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "DisableEnterpriseAuthProxy" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "MicrosoftEdgeDataOptIn" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "DisableTelemetryOptInChangeNotification" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "DisableTelemetryOptInSettingsUx" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" "EnableConfigFlighting" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "DoNotShowFeedbackNotifications" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "LimitEnhancedDiagnosticDataWindowsAnalytics" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowBuildPreview" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "LimitDiagnosticLogCollection" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "LimitDumpCollection" 1
    Set-Reg "HKLM:\SYSTEM\ControlSet001\Control\WMI\Autologger\Diagtrack-Listener" "Start" 0
    Set-Reg "HKLM:\SYSTEM\ControlSet001\Control\WMI\Autologger\SQMLogger" "Start" 0
}}
$Options += [PSCustomObject]@{Id=167; Cat="Confidentialite"; LabelFR="Désactiver le Programme d'amélioration (CEIP, toutes composantes)"; LabelEN="Disable Customer Experience Improvement Program (CEIP, all components)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" "CEIPEnable" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\AppV\CEIP" "CEIPEnable" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" "DisableCustomerImprovementProgram" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Messenger\Client" "CEIP" 2
}}
$Options += [PSCustomObject]@{Id=168; Cat="Confidentialite"; LabelFR="Couper les suggestions/contenus sponsorisés (menu Démarrer, verrouillage, apps pré-installées)"; LabelEN="Cut sponsored content/suggestions (Start menu, lock screen, pre-installed apps)"; Risk="safe"; Action={
    foreach ($hive in @("HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager")) {
        Set-Reg $hive "ContentDeliveryAllowed" 0
        Set-Reg $hive "SubscribedContentEnabled" 0
        Set-Reg $hive "SilentInstalledAppsEnabled" 0
        Set-Reg $hive "PreInstalledAppsEnabled" 0
        Set-Reg $hive "SoftLandingEnabled" 0
        Set-Reg $hive "RotatingLockScreenEnabled" 0
        Set-Reg $hive "RotatingLockScreenOverlayEnabled" 0
    }
}}
$Options += [PSCustomObject]@{Id=169; Cat="Confidentialite"; LabelFR="Compatibilité applicative approfondie (moteur, télémétrie app, inventaire programmes)"; LabelEN="Deep application compatibility (engine, app telemetry, program inventory)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableEngine" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "AITEnable" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableUAR" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableInventory" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "SbEnable" 1
}}
$Options += [PSCustomObject]@{Id=170; Cat="Confidentialite"; LabelFR="Restreindre les communications Internet automatiques (assistant, impression web, aide en ligne)"; LabelEN="Restrict automatic Internet communications (wizards, web printing, online help)"; Risk="moderate"; Action={
    foreach ($hive in @("HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer","HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
        Set-Reg $hive "NoPublishingWizard" 1
        Set-Reg $hive "NoWebServices" 1
        Set-Reg $hive "NoOnlinePrintsWizard" 1
        Set-Reg $hive "NoInternetOpenWith" 1
    }
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" "DisableHTTPPrinting" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" "DisableWebPnPDownload" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" "PreventHandwritingErrorReports" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" "PreventHandwritingDataSharing" 1
}}
$Options += [PSCustomObject]@{Id=171; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie NVIDIA Control Panel (si GPU NVIDIA)"; LabelEN="Disable NVIDIA Control Panel telemetry (if NVIDIA GPU)"; Risk="safe"; Action={
    Set-Reg "HKCU:\SOFTWARE\NVIDIA Corporation\NVControlPanel2\Client" "OptInOrOutPreference" 0
}}
$Options += [PSCustomObject]@{Id=172; Cat="Confidentialite"; LabelFR="Rapport d'erreurs Windows (policy) : coupe l'envoi de données et l'UI d'erreur"; LabelEN="Windows Error Reporting (policy): stop data upload and error UI"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" "AutoApproveOSDumps" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" "LoggingDisabled" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" "Disabled" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" "Disabled" 1
    Set-Reg "HKLM:\Software\Microsoft\Windows\Windows Error Reporting\Consent" "DefaultConsent" 0
    Set-Reg "HKLM:\Software\Microsoft\Windows\Windows Error Reporting\Consent" "DefaultOverrideBehavior" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" "DontSendAdditionalData" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" "DontShowUI" 1
}}
$Options += [PSCustomObject]@{Id=174; Cat="Gaming"; LabelFR="Fermer les applications qui plantent/ne répondent plus, plus vite (timeouts réduits)"; LabelEN="Close crashed/unresponsive apps faster (reduced timeouts)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Control Panel\Desktop" "HungAppTimeout" "2000"
    Set-Reg "HKCU:\Control Panel\Desktop" "WaitToKillAppTimeout" "2000"
    Set-Reg "HKCU:\Control Panel\Desktop" "LowLevelHooksTimeout" "2000"
    Set-Reg "HKCU:\Control Panel\Desktop" "AutoEndTasks" "1"
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "WaitToKillServiceTimeout" "2000"
}}
$Options += [PSCustomObject]@{Id=175; Cat="Extreme"; LabelFR="Autoriser l'installation de Windows 11 sur matériel non supporté (TPM/Secure Boot/CPU/RAM)"; LabelEN="Allow Windows 11 install on unsupported hardware (TPM/Secure Boot/CPU/RAM)"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SYSTEM\Setup\LabConfig" "BypassTPMCheck" 1
    Set-Reg "HKLM:\SYSTEM\Setup\LabConfig" "BypassSecureBootCheck" 1
    Set-Reg "HKLM:\SYSTEM\Setup\LabConfig" "BypassRAMCheck" 1
    Set-Reg "HKLM:\SYSTEM\Setup\LabConfig" "BypassStorageCheck" 1
    Set-Reg "HKLM:\SYSTEM\Setup\LabConfig" "BypassCPUCheck" 1
    Set-Reg "HKLM:\SYSTEM\Setup\MoSetup" "AllowUpgradesWithUnsupportedTPMOrCPU" 1
}}
$Options += [PSCustomObject]@{Id=176; Cat="Confidentialite"; LabelFR="Couper la synchronisation des paramètres via compte Microsoft (thème, mots de passe, WiFi, langue...)"; LabelEN="Disable Microsoft Account settings sync (theme, passwords, WiFi, language...)"; Risk="safe"; Action={
    $p = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync"
    Set-Reg $p "DisableSettingSync" 2; Set-Reg $p "DisableSettingSyncUserOverride" 1
    Set-Reg $p "DisableApplicationSettingSync" 2; Set-Reg $p "DisableApplicationSettingSyncUserOverride" 1
    Set-Reg $p "DisableCredentialsSettingSync" 2; Set-Reg $p "DisableCredentialsSettingSyncUserOverride" 1
    Set-Reg $p "DisableDesktopThemeSettingSync" 2; Set-Reg $p "DisableDesktopThemeSettingSyncUserOverride" 1
    Set-Reg $p "DisablePersonalizationSettingSync" 2; Set-Reg $p "DisablePersonalizationSettingSyncUserOverride" 1
    Set-Reg $p "DisableStartLayoutSettingSync" 2; Set-Reg $p "DisableStartLayoutSettingSyncUserOverride" 1
    Set-Reg $p "DisableWebBrowserSettingSync" 2; Set-Reg $p "DisableWebBrowserSettingSyncUserOverride" 1
    Set-Reg $p "DisableWindowsSettingSync" 2; Set-Reg $p "DisableWindowsSettingSyncUserOverride" 1
}}
$Options += [PSCustomObject]@{Id=177; Cat="Nettoyage"; LabelFR="Divers confort : pas de son au démarrage, pas d'alerte disque plein, pas de reconnexion auto après update, autoplay coupé"; LabelEN="Misc QoL: no startup sound, no low-disk-space nag, no auto-relogin after update, autoplay off"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "DisableStartupSound" 1
    Set-Reg "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoLowDiskSpaceChecks" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "DisableAutomaticRestartSignOn" 1
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoDriveTypeAutoRun" 255
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutoplayfornonVolume" 1
}}
$Options += [PSCustomObject]@{Id=178; Cat="Confidentialite"; LabelFR="Désactiver les suggestions de recherche en ligne (barre de recherche Windows)"; LabelEN="Disable online search suggestions (Windows search box)"; Risk="safe"; Action={
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "DisableSearchBoxSuggestions" 1
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "ConnectedSearchUseWeb" 0
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "ConnectedSearchPrivacy" 3
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "AllowCloudSearch" 0
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "AllowSearchToUseLocation" 0
}}
$Options += [PSCustomObject]@{Id=179; Cat="Bloatwares"; LabelFR="Nettoyer la barre des tâches (People Bar, Meet Now, Chat, bouton Task View, widgets News au niveau policy)"; LabelEN="Clean up taskbar (People Bar, Meet Now, Chat, Task View button, News widget at policy level)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowTaskViewButton" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" "EnableFeeds" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" "AllowNewsAndInterests" 0
    Set-Reg "HKCU:\Software\Policies\Microsoft\Windows\Explorer" "HidePeopleBar" 1
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HideSCAMeetNow" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" "ChatIcon" 3
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" 0
}}
$Options += [PSCustomObject]@{Id=180; Cat="Confidentialite"; LabelFR="Ne pas utiliser la recherche en ligne pour résoudre les raccourcis (résolution plus rapide)"; LabelEN="Don't use search-based resolution for shell shortcuts (faster resolution)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoResolveSearch" 1
}}
$Options += [PSCustomObject]@{Id=181; Cat="Confidentialite"; LabelFR="Couper toutes les apps en arrière-plan (interrupteur global, plus fin que le réglage par app)"; LabelEN="Turn off all background apps (global toggle, more thorough than the per-app setting)"; Risk="moderate"; CheckType="Reg"; CheckPath="HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"; CheckName="GlobalUserDisabled"; CheckValue=1; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" "GlobalUserDisabled" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsRunInBackground" 2
}}
$Options += [PSCustomObject]@{Id=182; Cat="Confidentialite"; LabelFR="Désactiver l'Autoplay et la recherche web pour les fichiers de type inconnu"; LabelEN="Disable Autoplay and web lookup for unknown file types"; Risk="safe"; Action={
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "DisableAutoplay" 1
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoInternetOpenWith" 1
}}
$Options += [PSCustomObject]@{Id=183; Cat="Bloatwares"; LabelFR="Supprimer les notifications publicitaires et pubs de fonctionnalités Windows"; LabelEN="Remove ad notifications and Windows feature advertisements"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" "NoCloudApplicationNotification" 1
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "NoBalloonFeatureAdvertisements" 1
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "EnableAutoTray" 0
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-353698Enabled" 0
}}
$Options += [PSCustomObject]@{Id=184; Cat="Gaming"; LabelFR="Désactiver la transparence et réduire les animations de l'interface (plus léger visuellement)"; LabelEN="Disable transparency and reduce interface animations (lighter visuals)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "EnableTransparency" 0
    Set-Reg "HKCU:\Control Panel\Desktop\WindowMetrics" "MinAnimate" "0" "String"
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarAnimations" 0
}}
$Options += [PSCustomObject]@{Id=185; Cat="Confidentialite"; LabelFR="Bloquer au lancement les .exe de télémétrie/pub Microsoft les plus tenaces (CompatTelRunner, AggregatorHost, DeviceCensus, pubs Bing/Copilot)"; LabelEN="Block launch of the most persistent Microsoft telemetry/ad executables (CompatTelRunner, AggregatorHost, DeviceCensus, Bing/Copilot ads)"; Risk="moderate"; Action={
    $blocked = @("CompatTelRunner.exe","AggregatorHost.exe","DeviceCensus.exe","FeatureLoader.exe","BingChatInstaller.exe","BGAUpsell.exe","BCILauncher.exe")
    foreach ($exe in $blocked) {
        Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$exe" "Debugger" "$env:windir\System32\taskkill.exe"
    }
}}
$Options += [PSCustomObject]@{Id=186; Cat="Gaming"; LabelFR="Déprioriser le CPU des process d'arrière-plan systeme (recherche, saisie, polices) pour laisser plus de CPU aux jeux"; LabelEN="Deprioritize CPU for background system processes (search, input, fonts) to leave more CPU for games"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" "CpuPriorityClass" 5
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ctfmon.exe\PerfOptions" "CpuPriorityClass" 5
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions" "CpuPriorityClass" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions" "IoPriority" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions" "CpuPriorityClass" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions" "IoPriority" 0
}}
$Options += [PSCustomObject]@{Id=196; Cat="Confidentialite"; LabelFR="Empêcher Windows de sonder activement les serveurs Microsoft pour tester la connexion internet (NCSI)"; LabelEN="Stop Windows from actively probing Microsoft servers to test internet connectivity (NCSI)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" "EnableActiveProbing" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList" "NoActiveProbe" 1
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\ContentIndex" "NoNetCrawling" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" "HttpAcceptLanguageOptOut" 1
}}
$Options += [PSCustomObject]@{Id=197; Cat="Confidentialite"; LabelFR="Désactiver l'envoi automatique du presse-papier vers le cloud/autres appareils"; LabelEN="Disable automatic clipboard upload to cloud/other devices"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Clipboard" "CloudClipboardAutomaticUpload" 0
    Set-Reg "HKCU:\Software\Microsoft\Terminal Server Client" "CloudClipRDPOverride" 0
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "EnableClipboardHistory" 0
}}
$Options += [PSCustomObject]@{Id=198; Cat="Bloatwares"; LabelFR="Menu Démarrer épuré : pas de recommandations, pas de liste 'utilisés récemment'"; LabelEN="Clean Start menu: no recommendations, no 'recently used' list"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Start_TrackDocs" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" "HideRecommendedSection" 1
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Start" "HideRecommendedPersonalizedSites" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start" "HideRecommendedSection" 1
}}
$Options += [PSCustomObject]@{Id=199; Cat="Gaming"; LabelFR="Désactiver la maintenance automatique planifiée de Windows (défrag/nettoyage/scans programmés)"; LabelEN="Disable Windows scheduled automatic maintenance (defrag/cleanup/scheduled scans)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" "MaintenanceDisabled" 1
}}
$Options += [PSCustomObject]@{Id=200; Cat="Confidentialite"; LabelFR="Couper la télémétrie PowerShell et Visual Studio (variante complémentaire)"; LabelEN="Disable PowerShell and Visual Studio telemetry (complementary variant)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "POWERSHELL_TELEMETRY_OPTOUT" "1" "String"
    Set-Reg "HKLM:\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" "OptIn" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" "DoReport" 0
}}
$Options += [PSCustomObject]@{Id=201; Cat="Bloatwares"; LabelFR="Restaurer le menu contextuel classique de Windows 10 (clic droit direct, sans 'Afficher plus d'options')"; LabelEN="Restore classic Windows 10 right-click context menu (direct, no 'Show more options')"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" "(default)" "" "String"
}}
$Options += [PSCustomObject]@{Id=202; Cat="Confidentialite"; LabelFR="Désactiver LLMNR (résolution de noms multicast, vecteur d'attaque réseau local connu) et la télémétrie encre/saisie"; LabelEN="Disable LLMNR (multicast name resolution, known local-network attack vector) and ink/typing telemetry"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" "EnableMulticast" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" "AllowLinguisticDataCollection" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService" "EnableDeviceHealthAttestationService" 0
}}
$Options += [PSCustomObject]@{Id=203; Cat="Gaming"; LabelFR="Déprioriser sppsvc (licence Windows) et arrêter les canaux d'événements Superfetch (léger, complète les tweaks CPU existants)"; LabelEN="Deprioritize sppsvc (Windows licensing) and stop Superfetch event log channels (light, complements existing CPU tweaks)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sppsvc.exe\PerfOptions" "CpuPriorityClass" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sppsvc.exe\PerfOptions" "IoPriority" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/Main" "Enable" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/PfApLog" "Enable" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/StoreLog" "Enable" 0
}}
$Options += [PSCustomObject]@{Id=204; Cat="Bloatwares"; LabelFR="[WinUtil] Désinstaller réellement les Widgets (paquet complet, pas juste masqué)"; LabelEN="[WinUtil] Actually uninstall Widgets (full package, not just hidden)"; Risk="moderate"; Action={
    Get-Process *Widget* -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
    Get-AppxPackage Microsoft.WidgetsPlatformRuntime -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    Get-AppxPackage MicrosoftWindows.Client.WebExperience -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
}}
$Options += [PSCustomObject]@{Id=205; Cat="Bloatwares"; LabelFR="[WinUtil] Bloquer les suggestions d'apps dans la recherche du menu Démarrer (Store)"; LabelEN="[WinUtil] Block Store app recommendations in Start menu search"; Risk="moderate"; Action={
    icacls "$Env:LocalAppData\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\LocalState\store.db" /deny Everyone:F 2>$null
}}
$Options += [PSCustomObject]@{Id=206; Cat="Confidentialite"; LabelFR="[WinUtil] Refuser la géolocalisation au niveau consentement matériel + capteurs + cartes"; LabelEN="[WinUtil] Deny location at the hardware consent level + sensors + maps"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" 0
    Set-Reg "HKLM:\SYSTEM\Maps" "AutoUpdateEnabled" 0
}}
$Options += [PSCustomObject]@{Id=207; Cat="Confidentialite"; LabelFR="[WinUtil] Bloquer l'exécution du WPBT (table binaire OEM au démarrage -- vecteur d'attaque connu, désactivation = plus sûr)"; LabelEN="[WinUtil] Block WPBT execution (OEM boot-time binary table -- known attack vector, disabling is safer)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" "DisableWpbtExecution" 1
}}
$Options += [PSCustomObject]@{Id=208; Cat="Confidentialite"; LabelFR="[WinUtil] Télémétrie complémentaire (pub par app, saisie/encre, échantillons Defender jamais envoyés, wermgr)"; LabelEN="[WinUtil] Complementary telemetry (per-app ads, ink/typing, Defender samples never sent, wermgr)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" "TailoredExperiencesWithDiagnosticDataEnabled" 0
    Set-Reg "HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" "HasAccepted" 0
    Set-Reg "HKCU:\Software\Microsoft\Input\TIPC" "Enabled" 0
    Set-Reg "HKCU:\Software\Microsoft\InputPersonalization" "RestrictImplicitInkCollection" 1
    Set-Reg "HKCU:\Software\Microsoft\InputPersonalization" "RestrictImplicitTextCollection" 1
    Set-Reg "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" "HarvestContacts" 0
    Set-Reg "HKCU:\Software\Microsoft\Siuf\Rules" "NumberOfSIUFInPeriod" 0
    try { Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction SilentlyContinue } catch {}
    Disable-Svc "wermgr"
}}
$Options += [PSCustomObject]@{Id=209; Cat="Bloatwares"; LabelFR="[WinUtil] Débloatage Microsoft Edge (télémétrie, pubs, extension pub bloquée, suggestions)"; LabelEN="[WinUtil] Microsoft Edge debloat (telemetry, ads, blocked ad extension, suggestions)"; Risk="moderate"; Action={
    $p = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate" "CreateDesktopShortcutDefault" 0
    Set-Reg $p "PersonalizationReportingEnabled" 0
    Set-Reg $p "ShowRecommendationsEnabled" 0
    Set-Reg $p "HideFirstRunExperience" 1
    Set-Reg $p "UserFeedbackAllowed" 0
    Set-Reg $p "ConfigureDoNotTrack" 1
    Set-Reg $p "AlternateErrorPagesEnabled" 0
    Set-Reg $p "EdgeCollectionsEnabled" 0
    Set-Reg $p "EdgeShoppingAssistantEnabled" 0
    Set-Reg $p "MicrosoftEdgeInsiderPromotionEnabled" 0
    Set-Reg $p "ShowMicrosoftRewards" 0
    Set-Reg $p "WebWidgetAllowed" 0
    Set-Reg $p "DiagnosticData" 0
    Set-Reg $p "EdgeAssetDeliveryServiceEnabled" 0
    Set-Reg $p "WalletDonationEnabled" 0
    Set-Reg $p "DefaultBrowserSettingsCampaignEnabled" 0
}}
$Options += [PSCustomObject]@{Id=210; Cat="Confidentialite"; LabelFR="[WinUtil] Désactiver les fonctionnalités consommateur Windows (installation auto de jeux/apps tierces)"; LabelEN="[WinUtil] Disable Windows consumer features (auto-install of games/third-party apps)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" 1
}}
$Options += [PSCustomObject]@{Id=211; Cat="Gaming"; LabelFR="[WinUtil] Xbox/Gaming complémentaire (Game Bar capture + paquets Xbox restants)"; LabelEN="[WinUtil] Complementary Xbox/Gaming (Game Bar capture + remaining Xbox packages)"; Risk="moderate"; Action={
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" 0
    foreach ($pkg in @("Microsoft.XboxIdentityProvider","Microsoft.XboxSpeechToTextOverlay","Microsoft.GamingApp","Microsoft.Xbox.TCUI","Microsoft.XboxGamingOverlay")) {
        Uninstall-Appx $pkg
    }
}}
$Options += [PSCustomObject]@{Id=212; Cat="Bloatwares"; LabelFR="[WinUtil] Apps pré-installées complémentaires (Bing, Todos, Sound Recorder, Sticky Notes, DevHome, Outlook nouveau, Alarms, GetHelp, Zune, Teams)"; LabelEN="[WinUtil] Complementary pre-installed apps (Bing, Todos, Sound Recorder, Sticky Notes, DevHome, new Outlook, Alarms, GetHelp, Zune, Teams)"; Risk="safe"; Action={
    foreach ($pkg in @("Microsoft.WindowsFeedbackHub","Microsoft.BingNews","Microsoft.BingSearch","Microsoft.BingWeather","Clipchamp.Clipchamp","Microsoft.Todos","Microsoft.PowerAutomateDesktop","Microsoft.WindowsSoundRecorder","Microsoft.MicrosoftStickyNotes","Microsoft.Windows.DevHome","Microsoft.OutlookForWindows","Microsoft.WindowsAlarms","Microsoft.StartExperiencesApp","Microsoft.GetHelp","Microsoft.ZuneMusic","MicrosoftCorporationII.QuickAssist","MSTeams")) {
        Uninstall-Appx $pkg
    }
    $TeamsPath = "$Env:LocalAppData\Microsoft\Teams\Update.exe"
    if (Test-Path $TeamsPath) {
        Start-Process $TeamsPath -ArgumentList "-uninstall" -Wait -ErrorAction SilentlyContinue
        Remove-Item $TeamsPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}}
$Options += [PSCustomObject]@{Id=213; Cat="Confidentialite"; LabelFR="[WinUtil] IA Windows complémentaire (paquet CoreAI, service WSAIFabricSvc)"; LabelEN="[WinUtil] Complementary Windows AI (CoreAI package, WSAIFabricSvc service)"; Risk="advanced"; Action={
    try {
        $Appx = (Get-AppxPackage MicrosoftWindows.Client.CoreAI -ErrorAction SilentlyContinue).PackageFullName
        if ($Appx) {
            $Sid = (Get-LocalUser $Env:UserName -ErrorAction SilentlyContinue).Sid.Value
            if ($Sid) { New-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\$Sid\$Appx" -Force -ErrorAction SilentlyContinue | Out-Null }
            Remove-AppxPackage $Appx -ErrorAction SilentlyContinue
        }
    } catch {}
    Disable-Svc "WSAIFabricSvc"
}}
$Options += [PSCustomObject]@{Id=214; Cat="Nettoyage"; LabelFR="[WinUtil] Divers confort (fin de tâche clic droit taskbar, correctif dual-boot UTC, masquer Accueil/Galerie Explorer)"; LabelEN="[WinUtil] Misc QoL (end task on taskbar right-click, dual-boot UTC fix, hide Explorer Home/Gallery)"; Risk="moderate"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" "TaskbarEndTask" 1
    Set-Reg "HKCU:\Software\Classes\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" "System.IsPinnedToNameSpaceTree" 0
    Set-Reg "HKCU:\Software\Classes\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" "System.IsPinnedToNameSpaceTree" 0
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "LaunchTo" 1
}}
$Options += [PSCustomObject]@{Id=193; Cat="Confidentialite"; LabelFR="Interdire à TOUTES les apps l'accès aux données sensibles (contacts, position, caméra, IA générative, fichiers, notifications...)"; LabelEN="Deny ALL apps access to sensitive data (contacts, location, camera, generative AI, files, notifications...)"; Risk="moderate"; Action={
    $p = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
    $caps = @("AccountInfo","Activity","AppDiagnostics","BackgroundSpatialPerception","Bluetooth","BluetoothSync","BroadFileSystemAccess","Calendar","CallHistory","CellularData","Contacts","DocumentsLibrary","DownloadsFolder","Email","EyeTracker","GazeInput","GenerativeAi","GraphicsCaptureProgrammatic","GraphicsCaptureWithoutBorder","HumanInterfaceDevice","HumanPresence","Location","Messaging","Motion","MusicLibrary","Notifications","Phone","PicturesLibrary","Radios","SpatialPerception","Tasks","TrustedDevices","UserAccountInformation","UserDataTasks","UserNotificationListener","VideosLibrary","VoiceActivation","FileSystem","TextAndImageGeneration")
    foreach ($cap in $caps) { Set-Reg $p "LetAppsAccess$cap" 2 }
    Set-Reg $p "LetAppsRunInBackground" 2
    Set-Reg $p "LetAppsGetDiagnosticInfo" 2
}}
$Options += [PSCustomObject]@{Id=194; Cat="Confidentialite"; LabelFR="Refuser l'accès matériel bas niveau (Bluetooth, capteurs de présence, suivi du regard, casques VR)"; LabelEN="Deny low-level hardware access (Bluetooth, presence sensors, eye tracking, VR headsets)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" "Value" "Deny"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\spatialPerception" "Value" "Deny"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\backgroundSpatialPerception" "Value" "Deny"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" "Value" "Deny"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanPresence" "Value" "Deny"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice" "Value" "Deny"
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" "Value" "Deny"
}}
$Options += [PSCustomObject]@{Id=195; Cat="Confidentialite"; LabelFR="Divers confidentialité complémentaires (voix, WiFi Sense, cartes auto, historique récent, notifications verrouillage)"; LabelEN="Misc extra privacy (voice, WiFi Sense, auto maps, recent history, lock screen notifications)"; Risk="safe"; Action={
    Set-Reg "HKLM:\Software\Microsoft\Speech_OneCore\Preferences" "VoiceActivationDefaultOn" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" "DisableVoice" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" "value" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" "Enabled" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps" "AutoDownloadAndUpdateMapData" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoRecentDocsHistory" 1
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "ClearRecentDocsOnExit" 1
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" "ShowRecent" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "DisableLockScreenAppNotifications" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "AllowOnlineTips" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowDesktopAnalyticsProcessing" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowWUfBCloudProcessing" 0
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowUpdateComplianceProcessing" 0
    Set-Reg "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" "DisableOneSettingsDownloads" 1
}}
$Options += [PSCustomObject]@{Id=189; Cat="Gaming"; LabelFR="Affiner le Raw Input souris (throttle, anti-trainées, pas d'accroche au bouton par défaut)"; LabelEN="Fine-tune raw mouse input (throttle, no trails, no default button snap)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Control Panel\Mouse" "RawMouseThrottleEnabled" 1
    Set-Reg "HKCU:\Control Panel\Mouse" "RawMouseThrottleForced" 1
    Set-Reg "HKCU:\Control Panel\Mouse" "RawMouseThrottleDuration" 20
    Set-Reg "HKCU:\Control Panel\Mouse" "RawMouseThrottleLeeway" 0
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseTrails" "0" "String"
    Set-Reg "HKCU:\Control Panel\Mouse" "SnapToDefaultButton" "0" "String"
    Set-Reg "HKCU:\Control Panel\Desktop" "ScreenSaveActive" "0" "String"
    Set-Reg "HKCU:\Control Panel\Desktop" "FontSmoothing" "2" "String"
}}
$Options += [PSCustomObject]@{Id=190; Cat="Gaming"; LabelFR="Désactiver l'économie d'énergie de TOUTES les cartes réseau détectées (boucle automatique, ignore WAN/virtuel/Bluetooth)"; LabelEN="Disable power saving on ALL detected network adapters (auto loop, skips WAN/virtual/Bluetooth)"; Risk="moderate"; Action={
    $nicClass = 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}'
    if (Test-Path $nicClass) {
        Get-ChildItem -Path $nicClass -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match '^\d{4}$' } | ForEach-Object {
            $key = $_.PSPath
            try {
                $driverDesc = (Get-ItemProperty -Path $key -Name 'DriverDesc' -ErrorAction SilentlyContinue).DriverDesc
                if (-not $driverDesc) { return }
                if ($driverDesc -match 'WAN Miniport|Kernel Debug|Virtual|Loopback|Teredo|ISATAP|6to4|Bluetooth') { return }
                Set-ItemProperty -Path $key -Name 'PnPCapabilities' -Value 24 -Type DWord -Force -ErrorAction SilentlyContinue
                foreach ($prop in @('*EEE','AdvancedEEE','EnableGreenEthernet','EnablePME','ULPMode','EnableSavePowerNow','ReduceSpeedOnPowerDown','WakeOnMagicPacket','WakeOnPattern','WolShutdownLinkSpeed','EnableWakeOnLan')) {
                    try {
                        if (Get-ItemProperty -Path $key -Name $prop -ErrorAction SilentlyContinue) {
                            Set-ItemProperty -Path $key -Name $prop -Value '0' -Type String -Force -ErrorAction SilentlyContinue
                        }
                    } catch {}
                }
            } catch {}
        }
    }
}}
$Options += [PSCustomObject]@{Id=191; Cat="Gaming"; LabelFR="Désactiver la suspension sélective USB sur TOUS les périphériques détectés (boucle automatique)"; LabelEN="Disable selective suspend on ALL detected USB devices (auto loop)"; Risk="moderate"; Action={
    $usbRoot = 'HKLM:\SYSTEM\CurrentControlSet\Enum\USB'
    if (Test-Path $usbRoot) {
        Get-ChildItem -Path $usbRoot -ErrorAction SilentlyContinue | ForEach-Object {
            Get-ChildItem -Path $_.PSPath -ErrorAction SilentlyContinue | ForEach-Object {
                $params = Join-Path $_.PSPath 'Device Parameters'
                if (Test-Path $params) {
                    try {
                        Set-ItemProperty -Path $params -Name 'EnhancedPowerManagementEnabled' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $params -Name 'SelectiveSuspendEnabled' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $params -Name 'AllowIdleIrpInD3' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $params -Name 'DeviceSelectiveSuspended' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                    } catch {}
                }
            }
        }
    }
    powercfg -attributes 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 -ATTRIB_HIDE
    powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
    powercfg /setactive scheme_current
}}
$Options += [PSCustomObject]@{Id=192; Cat="Gaming"; LabelFR="Verrouiller les fréquences GPU NVIDIA (empêche le throttling P-State, si carte NVIDIA détectée)"; LabelEN="Lock NVIDIA GPU clocks (prevents P-State throttling, if NVIDIA card detected)"; Risk="advanced"; Action={
    $dispClass = 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}'
    if (Test-Path $dispClass) {
        Get-ChildItem -Path $dispClass -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match '^\d{4}$' } | ForEach-Object {
            $key = $_.PSPath
            try {
                $driverDesc = (Get-ItemProperty -Path $key -Name 'DriverDesc' -ErrorAction SilentlyContinue).DriverDesc
                $provider = (Get-ItemProperty -Path $key -Name 'ProviderName' -ErrorAction SilentlyContinue).ProviderName
                if (($driverDesc -and $driverDesc -match 'NVIDIA|GeForce|Quadro|RTX|GTX') -or ($provider -and $provider -match 'NVIDIA')) {
                    Set-ItemProperty -Path $key -Name 'DisableDynamicPstate' -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                }
            } catch {}
        }
    }
}}
$Options += [PSCustomObject]@{Id=187; Cat="Nettoyage"; LabelFR="Libérer le stockage réservé Windows Update (~7 Go) et bloquer les notifications de mise a niveau forcée"; LabelEN="Free Windows Update reserved storage (~7 GB) and block forced upgrade notifications"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" "ShippedWithReserves" 0
    Set-Reg "HKLM:\SYSTEM\Setup\UpgradeNotification" "UpgradeAvailable" 0
    Set-Reg "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" "HideMCTLink" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" "RestartNotificationsAllowed2" 0
}}
$Options += [PSCustomObject]@{Id=188; Cat="Bloatwares"; LabelFR="Empêcher Windows Update d'installer de force DevHome/Outlook (nouveau), et bloquer les MàJ auto du Store"; LabelEN="Prevent Windows Update from force-installing DevHome/new Outlook, and block auto Store app updates"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator\UScheduler\DevHomeUpdate" "workCompleted" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator\UScheduler\OutlookUpdate" "workCompleted" 1
    Set-Reg "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe" "BlockedOobeUpdaters" '["MS_Outlook"]'
    Set-Reg "HKLM:\Software\Policies\Microsoft\WindowsStore" "AutoDownload" 4
    Set-Reg "HKLM:\Software\Policies\Microsoft\WindowsStore" "DisableOSUpgrade" 1
}}
$Options += [PSCustomObject]@{Id=173; Cat="Confidentialite"; LabelFR="Couper Windows Spotlight / conseils / contenus cloud optimises (verrouillage, parametres, centre notifs)"; LabelEN="Turn off Windows Spotlight / tips / cloud-optimized content (lock screen, settings, action center)"; Risk="safe"; Action={
    Set-Reg "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" "DisableSoftLanding" 1
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableCloudOptimizedContent" 1
    foreach ($hive in @("HKCU:\Software\Policies\Microsoft\Windows\CloudContent","Registry::HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\CloudContent")) {
        Set-Reg $hive "ConfigureWindowsSpotlight" 2
        Set-Reg $hive "IncludeEnterpriseSpotlight" 0
        Set-Reg $hive "DisableThirdPartySuggestions" 1
        Set-Reg $hive "DisableTailoredExperiencesWithDiagnosticData" 1
        Set-Reg $hive "DisableWindowsSpotlightFeatures" 1
        Set-Reg $hive "DisableWindowsSpotlightWindowsWelcomeExperience" 1
        Set-Reg $hive "DisableWindowsSpotlightOnActionCenter" 1
        Set-Reg $hive "DisableWindowsSpotlightOnSettings" 1
    }
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableTailoredExperiencesWithDiagnosticData" 1
}}
$Options += [PSCustomObject]@{Id=65; Cat="Services"; LabelFR="Désactiver le Spouleur d'impression"; LabelEN="Disable Print Spooler execution loop service (If printerless)"; Risk="moderate"; CheckType="Svc"; CheckSvc="Spooler"; Action={ Disable-Svc "Spooler" }}
$Options += [PSCustomObject]@{Id=66; Cat="Services"; LabelFR="Désactiver le Service Fax"; LabelEN="Disable legacy faxing subsystem layout architecture"; Risk="safe"; CheckType="Svc"; CheckSvc="Fax"; Action={ Disable-Svc "Fax" }}
$Options += [PSCustomObject]@{Id=67; Cat="Services"; LabelFR="Désactiver le Registre à distance (RemoteRegistry)"; LabelEN="Disable Remote Registry modifications system process"; Risk="safe"; CheckType="Svc"; CheckSvc="RemoteRegistry"; Action={ Disable-Svc "RemoteRegistry" }}
$Options += [PSCustomObject]@{Id=68; Cat="Services"; LabelFR="Désactiver l'assistant compatibilité des programmes"; LabelEN="Disable Program Compatibility Assistant Service (PcaSvc)"; Risk="safe"; CheckType="Svc"; CheckSvc="PcaSvc"; Action={ Disable-Svc "PcaSvc" }}
$Options += [PSCustomObject]@{Id=69; Cat="Services"; LabelFR="Désactiver la géolocalisation et les cartes"; LabelEN="Disable Geolocation tracker loop & Downloaded Maps Manager"; Risk="moderate"; Action={ Disable-Svc "MapsBroker"; Disable-Svc "lfsvc" }}
$Options += [PSCustomObject]@{Id=74; Cat="Services"; LabelFR="Désactiver le service de rapport d'erreurs (WerSvc)"; LabelEN="Disable Windows Error Reporting Service data uploading loops"; Risk="safe"; CheckType="Svc"; CheckSvc="WerSvc"; Action={ Disable-Svc "WerSvc" }}
# --- Ajouts issus de ReviOS (services absents de la liste d'origine) ---
$Options += [PSCustomObject]@{Id=158; Cat="Services"; LabelFR="Désactiver Desktop Activity Moderator Driver (dam)"; LabelEN="Disable Desktop Activity Moderator Driver (dam)"; Risk="moderate"; CheckType="Svc"; CheckSvc="dam"; Action={ Disable-Svc "dam" }}
$Options += [PSCustomObject]@{Id=159; Cat="Services"; LabelFR="Désactiver GPU Energy Driver"; LabelEN="Disable GPU Energy Driver"; Risk="moderate"; CheckType="Svc"; CheckSvc="GpuEnergyDrv"; Action={ Disable-Svc "GpuEnergyDrv" }}
$Options += [PSCustomObject]@{Id=160; Cat="Services"; LabelFR="Désactiver Diagnostics Hub Standard Collector"; LabelEN="Disable Diagnostics Hub Standard Collector Service"; Risk="safe"; CheckType="Svc"; CheckSvc="diagnosticshub.standardcollector.service"; Action={ Disable-Svc "diagnosticshub.standardcollector.service" }}
$Options += [PSCustomObject]@{Id=161; Cat="Services"; LabelFR="Désactiver le service Windows Insider (wisvc)"; LabelEN="Disable Windows Insider Service (wisvc)"; Risk="safe"; CheckType="Svc"; CheckSvc="wisvc"; Action={ Disable-Svc "wisvc" }}
$Options += [PSCustomObject]@{Id=162; Cat="Services"; LabelFR="Désactiver les hôtes de diagnostic (WdiServiceHost/WdiSystemHost)"; LabelEN="Disable Diagnostic Service/System Host"; Risk="safe"; Action={ Disable-Svc "WdiServiceHost"; Disable-Svc "WdiSystemHost" }}
$Options += [PSCustomObject]@{Id=163; Cat="Services"; LabelFR="Désactiver le collecteur d'événements Windows (Wecsvc)"; LabelEN="Disable Windows Event Collector (Wecsvc)"; Risk="moderate"; CheckType="Svc"; CheckSvc="Wecsvc"; Action={ Disable-Svc "Wecsvc" }}
$Options += [PSCustomObject]@{Id=164; Cat="Services"; LabelFR="Désactiver NetBT (NetBIOS sur TCP/IP -- peut casser le partage fichiers/imprimante sur certains reseaux locaux anciens)"; LabelEN="Disable NetBT (NetBIOS over TCP/IP -- may break legacy LAN file/printer sharing on some networks)"; Risk="advanced"; CheckType="Svc"; CheckSvc="NetBT"; Action={ Disable-Svc "NetBT" }}
$Options += [PSCustomObject]@{Id=165; Cat="Services"; LabelFR="Désactiver UCPD (User Choice Protection Driver -- retire une protection contre le detournement d'applications par defaut, a ton propre risque)"; LabelEN="Disable UCPD (User Choice Protection Driver -- removes a default-app hijacking protection, use at your own risk)"; Risk="advanced"; CheckType="Svc"; CheckSvc="UCPD"; Action={ Disable-Svc "UCPD" }}

# --- 8. NETTOYAGE ET RAM ---
$Options += [PSCustomObject]@{Id=76; Cat="Nettoyage"; LabelFR="Vider les fichiers temporaires (%TEMP%)"; LabelEN="Purge user environment temp dump files structures (%TEMP%)"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=77; Cat="Nettoyage"; LabelFR="Vider la Corbeille de tous les disques"; LabelEN="Empty system garbage recycling cache structures across all disks"; Risk="safe"; Action={ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=78; Cat="Nettoyage"; LabelFR="Supprimer le cache Windows Update"; LabelEN="Wipe software updates download directories repository cache"; Risk="moderate"; Action={ Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=79; Cat="Nettoyage"; LabelFR="Purger l'historique des rapports d'erreurs Windows"; LabelEN="Clear out local Windows Error Reporting archive dumps folders"; Risk="safe"; Action={ Remove-Item "$env:ALLUSERSPROFILE\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=80; Cat="Nettoyage"; LabelFR="Nettoyer les composants WinSxS via DISM"; LabelEN="Force deep WinSxS component storage optimization runs via DISM"; Risk="advanced"; Action={ Start-Process "dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }}
$Options += [PSCustomObject]@{Id=81; Cat="Nettoyage"; LabelFR="Vider le dossier Prefetch de Windows"; LabelEN="Purge prefetch operational memory directory data stores"; Risk="moderate"; Action={ Remove-Item "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=83; Cat="Nettoyage"; LabelFR="Optimiser et défragmenter les disques SSD (Trim)"; LabelEN="Invoke structural hardware layout storage pass (Trim engine)"; Risk="safe"; Action={ Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=86; Cat="Nettoyage"; LabelFR="Supprimer le fichier Swapfile.sys inutile"; LabelEN="Disable low memory app paging executive allocation file handles"; Risk="moderate"; CheckType="Reg"; CheckPath="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"; CheckName="DisablePagingExecutive"; CheckValue=1; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "DisablePagingExecutive" 1 }}
$Options += [PSCustomObject]@{Id=89; Cat="Nettoyage"; LabelFR="Forcer le vidage de la mémoire RAM en cache"; LabelEN="Force global garbage collector collection sweeps across active RAM"; Risk="safe"; Action={ [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers() }}
$Options += [PSCustomObject]@{Id=143; Cat="Nettoyage"; LabelFR="Désactiver le nettoyage automatique Storage Sense"; LabelEN="Disable automatic Storage Sense cleanup (avoids deleting files mid-session)"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy"; CheckName="01"; CheckValue=0; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" "01" 0 }}
$Options += [PSCustomObject]@{Id=144; Cat="Nettoyage"; LabelFR="Supprimer le dossier Windows.old (libère plusieurs Go, si présent)"; LabelEN="Delete Windows.old folder (frees several GB, only if present)"; Risk="moderate"; Action={ if (Test-Path "$env:SystemDrive\Windows.old") { Remove-Item "$env:SystemDrive\Windows.old" -Recurse -Force -ErrorAction Stop } else { throw "Dossier Windows.old introuvable (deja nettoye ou jamais cree)" } }}

# --- 9. APPLICATIONS CLASSIFIÉES ---
# Pilotes Graphiques
$Options += [PSCustomObject]@{Id=125; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="NVIDIA GeForce Game Ready Driver"; LabelEN="NVIDIA GeForce Game Ready Driver Core"; Risk="safe"; Action={ Install-WingetApp "Nvidia.GeForceNow" "GeForce Now/Driver" }}
$Options += [PSCustomObject]@{Id=126; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="AMD Software: Adrenalin Edition"; LabelEN="AMD Software Adrenalin Graphics Driver Edition"; Risk="safe"; Action={ Install-WingetApp "AMD.Adrenalin" "AMD Adrenalin" }}
$Options += [PSCustomObject]@{Id=127; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="Intel Graphics Command Center"; LabelEN="Intel Graphics Command Center Controller Suite"; Risk="safe"; Action={ Install-WingetApp "Intel.GraphicsCommandCenter" "Intel Graphics Center" }}

# Navigateurs Web
$Options += [PSCustomObject]@{Id=91; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Google Chrome"; LabelEN="Google Chrome Web Browser"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" "Google Chrome" }}
$Options += [PSCustomObject]@{Id=92; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Mozilla Firefox"; LabelEN="Mozilla Firefox Browser"; Risk="safe"; Action={ Install-WingetApp "Mozilla.Firefox" "Mozilla Firefox" }}
$Options += [PSCustomObject]@{Id=93; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Brave Browser"; LabelEN="Brave Privacy Web Browser"; Risk="safe"; Action={ Install-WingetApp "Brave.Brave" "Brave Browser" }}
$Options += [PSCustomObject]@{Id=113; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Opera GX"; LabelEN="Opera GX Browser Tailored Core For Gamers"; Risk="safe"; Action={ Install-WingetApp "Opera.OperaGX" "Opera GX" }}

# Gaming & Launchers
$Options += [PSCustomObject]@{Id=95; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="Steam"; LabelEN="Valve Steam Gaming Platform Store"; Risk="safe"; Action={ Install-WingetApp "Valve.Steam" "Steam" }}
$Options += [PSCustomObject]@{Id=96; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="Epic Games Launcher"; LabelEN="Epic Games Store Storefront Launcher"; Risk="safe"; Action={ Install-WingetApp "EpicGames.EpicGamesLauncher" "Epic Games" }}
$Options += [PSCustomObject]@{Id=97; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="EA App (Electronic Arts)"; LabelEN="Electronic Arts Desktop Client App"; Risk="safe"; Action={ Install-WingetApp "ElectronicArts.EADesktop" "EA App" }}
$Options += [PSCustomObject]@{Id=104; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="MSI Afterburner"; LabelEN="MSI Afterburner Overclocking Hardware Monitor"; Risk="safe"; Action={ Install-WingetApp "Guru3D.MSIAfterburner" "MSI Afterburner" }}

# Outils & Productivité
$Options += [PSCustomObject]@{Id=99; Cat="Apps"; SubCat="FR=Outils & Productivité|EN=Tools & Productivity"; LabelFR="7-Zip (Archivage)"; LabelEN="7-Zip High Compression Ratio File Unpacker"; Risk="safe"; Action={ Install-WingetApp "7zip.7zip" "7-Zip" }}
$Options += [PSCustomObject]@{Id=100; Cat="Apps"; SubCat="FR=Outils & Productivité|EN=Tools & Productivity"; LabelFR="WinRAR"; LabelEN="WinRAR Compress Archive Manager Tool"; Risk="safe"; Action={ Install-WingetApp "RARLab.WinRAR" "WinRAR" }}

# Développement
$Options += [PSCustomObject]@{Id=105; Cat="Apps"; SubCat="FR=Développement|EN=Development Tools"; LabelFR="Visual Studio Code"; LabelEN="Microsoft Visual Studio Code Source Code Editor"; Risk="safe"; Action={ Install-WingetApp "Microsoft.VisualStudioCode" "VS Code" }}
$Options += [PSCustomObject]@{Id=106; Cat="Apps"; SubCat="FR=Développement|EN=Development Tools"; LabelFR="Notepad++"; LabelEN="NotepadPlusPlus Source Code Code Editor Engine"; Risk="safe"; Action={ Install-WingetApp "Notepad++.Notepad++" "Notepad++" }}

# Communication & Multimédia
$Options += [PSCustomObject]@{Id=94; Cat="Apps"; SubCat="FR=Communication & Multimédia|EN=Communication & Multimedia"; LabelFR="Discord"; LabelEN="Discord Chat Client Application"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" "Discord" }}
$Options += [PSCustomObject]@{Id=110; Cat="Apps"; SubCat="FR=Communication & Multimédia|EN=Communication & Multimedia"; LabelFR="Spotify"; LabelEN="Spotify Desktop Digital Music Service Platform"; Risk="safe"; Action={ Install-WingetApp "Spotify.Spotify" "Spotify" }}
$Options += [PSCustomObject]@{Id=111; Cat="Apps"; SubCat="FR=Communication & Multimédia|EN=Communication & Multimedia"; LabelFR="qBittorrent"; LabelEN="qBittorrent Free Open Source BitTorrent Client"; Risk="safe"; Action={ Install-WingetApp "qBittorrent.qBittorrent" "qBittorrent" }}

# --- 11. PERFORMANCE EXTRÊME (techniques kernel avancées) ---
$Options += [PSCustomObject]@{Id=155; Cat="Extreme"; LabelFR="Désactiver la compression mémoire Windows (libère du CPU, coûte de la RAM)"; LabelEN="Disable Windows Memory Compression (frees CPU, costs RAM)"; Risk="moderate"; Action={
    try {
        Disable-MMAgent -mc -ErrorAction Stop
    } catch {
        throw "Ce réglage dépend du service SysMain — s'il est désactivé (tweak SysMain coché), ce réglage ne peut pas s'appliquer. Décoche SysMain si tu veux garder celui-ci."
    }
}}
$Options += [PSCustomObject]@{Id=149; Cat="Extreme"; LabelFR="Forcer l'exécution des tâches de maintenance Windows (ProcessIdleTasks)"; LabelEN="Force execution of Windows idle maintenance tasks (ProcessIdleTasks)"; Risk="safe"; Action={ Start-Process "rundll32.exe" -ArgumentList "advapi32.dll,ProcessIdleTasks" -Wait -WindowStyle Hidden }}
$Options += [PSCustomObject]@{Id=150; Cat="Extreme"; LabelFR="Purger la Standby List (technique kernel non documentée, comme RAMMap)"; LabelEN="Purge the Standby List (undocumented kernel technique, like RAMMap)"; Risk="advanced"; Action={
    $result = [MemoryTools]::EmptyStandbyList()
    if ($result -ne 0) { throw "NtSetSystemInformation a retourné le code $result (privilège refusé ?)" }
}}
$Options += [PSCustomObject]@{Id=151; Cat="Extreme"; LabelFR="Bloquer les serveurs de télémétrie Microsoft (fichier hosts)"; LabelEN="Block Microsoft telemetry servers (hosts file)"; Risk="advanced"; Action={
    $hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
    $domains = @(
        "vortex.data.microsoft.com","vortex-win.data.microsoft.com","telecommand.telemetry.microsoft.com",
        "oca.telemetry.microsoft.com","sqm.telemetry.microsoft.com","watson.telemetry.microsoft.com",
        "redir.metaservices.microsoft.com","choice.microsoft.com","diagnostics.support.microsoft.com",
        "corpext.msitadfs.glbdns2.microsoft.com","compatexchange.cloudapp.net","cs1.wpc.v0cdn.net",
        "statsfe2.ws.microsoft.com","feedback.windows.com","feedback.search.microsoft.com"
    )
    $lastError = $null
    $success = $false
    for ($attempt = 1; $attempt -le 5; $attempt++) {
        try {
            $current = Get-Content $hostsPath -Raw -ErrorAction Stop
            if ($null -eq $current) { $current = "" }
            $toAdd = $domains | Where-Object { $current -notmatch [regex]::Escape($_) } | ForEach-Object { "0.0.0.0 $_" }
            if ($toAdd.Count -gt 0) {
                [System.IO.File]::AppendAllLines($hostsPath, [string[]]$toAdd)
            }
            $success = $true
            break
        } catch {
            $lastError = $_.Exception.Message
            Start-Sleep -Milliseconds 700
        }
    }
    if (-not $success) {
        throw "Fichier hosts verrouillé après 5 tentatives (antivirus ou autre logiciel l'utilise) : $lastError"
    }
}}

# --- 12. INNOVATIONS ---
$Options += [PSCustomObject]@{Id=156; Cat="Innovations"; LabelFR="Vider les caches de shaders DirectX/GPU (corrige les micro-saccades)"; LabelEN="Clear DirectX/GPU shader caches (fixes micro-stutters)"; Risk="safe"; Action={
    $paths = @(
        "$env:LOCALAPPDATA\D3DSCache",
        "$env:LOCALAPPDATA\NVIDIA\DXCache",
        "$env:LOCALAPPDATA\NVIDIA\GLCache",
        "$env:LOCALAPPDATA\AMD\DxCache",
        "$env:LOCALAPPDATA\AMD\DxcCache"
    )
    $cleaned = 0
    foreach ($p in $paths) {
        if (Test-Path $p) {
            Remove-Item "$p\*" -Recurse -Force -ErrorAction SilentlyContinue
            $cleaned++
        }
    }
    if ($cleaned -eq 0) { throw "Aucun cache de shaders trouvé sur cette machine (normal si aucun jeu n'a encore tourné)" }
}}
$Options += [PSCustomObject]@{Id=157; Cat="Innovations"; LabelFR="Reconstruire le cache d'icônes Windows (corrige les icônes cassées)"; LabelEN="Rebuild Windows icon cache (fixes broken icons)"; Risk="safe"; Action={
    Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 500
    Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache*" -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    Start-Process "explorer.exe"
}}


$Options += [PSCustomObject]@{Id=128; Cat="Bloatwares"; LabelFR="Désinstaller OneDrive (Stockage Cloud)"; LabelEN="Fully uninstall Microsoft OneDrive"; Risk="safe"; Action={
    Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 500
    $setupPaths = @(
        "$env:LOCALAPPDATA\Microsoft\OneDrive\OneDriveSetup.exe",
        "$env:SystemRoot\SysWOW64\OneDriveSetup.exe",
        "$env:SystemRoot\System32\OneDriveSetup.exe"
    )
    $foundPath = $setupPaths | Where-Object { Test-Path $_ } | Select-Object -First 1
    if ($foundPath) {
        Start-Process $foundPath -ArgumentList "/uninstall" -Wait -ErrorAction Stop
    }
    try { Uninstall-Appx "OneDrive" | Out-Null } catch { }
    if (-not $foundPath) { throw "OneDriveSetup.exe introuvable (déjà désinstallé, ou chemin non standard sur cette machine)" }
}}
$Options += [PSCustomObject]@{Id=129; Cat="Bloatwares"; LabelFR="Désinstaller Cortana (Assistant obsolète)"; LabelEN="Uninstall Cortana voice assistant"; Risk="safe"; Action={ Uninstall-Appx "Microsoft.549981C3F5F10" }}
$Options += [PSCustomObject]@{Id=130; Cat="Bloatwares"; LabelFR="Désinstaller Mobile Connecté (Phone Link / Your Phone)"; LabelEN="Uninstall Link to Windows / Phone Link"; Risk="safe"; Action={ Uninstall-Appx "YourPhone" }}
$Options += [PSCustomObject]@{Id=131; Cat="Bloatwares"; LabelFR="Désinstaller l'écosystème Xbox App intégré"; LabelEN="Uninstall default Windows Xbox App elements"; Risk="moderate"; Action={ Uninstall-Appx "XboxApp"; Uninstall-Appx "XboxGamingOverlay"; Uninstall-Appx "XboxSpeechToTextOverlay" }}
$Options += [PSCustomObject]@{Id=132; Cat="Bloatwares"; LabelFR="Désinstaller Cartes Windows (Windows Maps)"; LabelEN="Uninstall native Windows Maps application package"; Risk="safe"; Action={ Uninstall-Appx "WindowsMaps" }}
$Options += [PSCustomObject]@{Id=133; Cat="Bloatwares"; LabelFR="Désinstaller Microsoft Solitaire Collection"; LabelEN="Uninstall Microsoft Solitaire Collection game"; Risk="safe"; Action={ Uninstall-Appx "MicrosoftSolitaireCollection" }}
$Options += [PSCustomObject]@{Id=137; Cat="Bloatwares"; LabelFR="Retirer 'Actualités et champs d'intérêt' (News/Widgets Barre des tâches)"; LabelEN="Disable News and Interests taskbar widget feed"; Risk="safe"; CheckType="Reg"; CheckPath="HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"; CheckName="ShellFeedsTaskbarViewMode"; CheckValue=2; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" "ShellFeedsTaskbarViewMode" 2 }}
$Options += [PSCustomObject]@{Id=138; Cat="Bloatwares"; LabelFR="Désinstaller l'éditeur vidéo Clipchamp"; LabelEN="Uninstall Microsoft Clipchamp Video Editor app"; Risk="safe"; Action={ Uninstall-Appx "Clipchamp" }}
$Options += [PSCustomObject]@{Id=139; Cat="Bloatwares"; LabelFR="Désinstaller Paint 3D"; LabelEN="Uninstall Paint 3D Microsoft Package"; Risk="safe"; Action={ Uninstall-Appx "MSPaint" }}
$Options += [PSCustomObject]@{Id=145; Cat="Bloatwares"; LabelFR="Désinstaller Microsoft Copilot"; LabelEN="Uninstall Microsoft Copilot"; Risk="safe"; Action={ Uninstall-Appx "Microsoft.Copilot"; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" "TurnOffWindowsCopilot" 1 }}
$Options += [PSCustomObject]@{Id=146; Cat="Bloatwares"; LabelFR="Désinstaller les Widgets (icône Actualités barre des tâches)"; LabelEN="Uninstall Windows Widgets (taskbar News icon)"; Risk="safe"; Action={ Uninstall-Appx "MicrosoftWindows.Client.WebExperience"; Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" 0; Disable-Svc "WidgetsService" }}
$Options += [PSCustomObject]@{Id=147; Cat="Bloatwares"; LabelFR="Désactiver Recall (Windows 11 24H2+, si présent)"; LabelEN="Disable Recall (Windows 11 24H2+, if present)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" "DisableAIDataAnalysis" 1
    $feature = Get-WindowsOptionalFeature -Online -FeatureName "Recall" -ErrorAction SilentlyContinue
    if ($null -ne $feature) { Disable-WindowsOptionalFeature -Online -FeatureName "Recall" -NoRestart -ErrorAction SilentlyContinue | Out-Null }
}}

# ============================================================
# INTERFACE GRAPHIQUE (WPF) - DESIGN V15.1
# ============================================================
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="OPTI-DYLAN TOOLKIT" Height="930" Width="1130"
        WindowStartupLocation="CenterScreen" Background="#0A0A0E" ResizeMode="CanMinimize">
    <Window.Resources>
        <Style TargetType="CheckBox">
            <Setter Property="Foreground" Value="#DCDCE6"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <StackPanel Orientation="Horizontal">
                            <Border x:Name="Box" Width="18" Height="18" Background="#181824" BorderBrush="#3A3A4A" BorderThickness="1" CornerRadius="3" Margin="0,0,10,0" VerticalAlignment="Center">
                                <Path x:Name="CheckMark" Data="M 2 7 L 6.5 12 L 15 2" Stroke="#00FFC8" StrokeThickness="2.2" StrokeStartLineCap="Round" StrokeEndLineCap="Round" Visibility="Collapsed"/>
                            </Border>
                            <ContentPresenter VerticalAlignment="Center" TextElement.Foreground="{TemplateBinding Foreground}"/>
                        </StackPanel>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                                <Setter TargetName="Box" Property="BorderBrush" Value="#00FFC8"/>
                            </Trigger>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="Box" Property="BorderBrush" Value="#00FFC8"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="280"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        
        <Grid Grid.Column="0" Background="#101016">
            <ScrollViewer VerticalScrollBarVisibility="Auto">
                <StackPanel Margin="10,15,10,10">
                    <TextBlock Name="TxtMainTitle" Text="OPTI-DYLAN" FontSize="20" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,4"/>
                    <TextBlock Name="TxtSubtitle" Text="Chaque case = une vraie action" FontSize="10" Foreground="#707080" HorizontalAlignment="Center" Margin="0,0,0,12"/>
                    
                    <Border Background="#161622" CornerRadius="5" Padding="10" Margin="0,0,0,12">
                        <TextBlock Name="TxtLegend" Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap"/>
                    </Border>
                    
                    <Button Name="BtnReseau" Tag="Reseau" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnConfidentialite" Tag="Confidentialite" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnGaming" Tag="Gaming" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnProcessus" Tag="Processus" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnTimer" Tag="Timer" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnPower" Tag="Power" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnServices" Tag="Services" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnNettoyage" Tag="Nettoyage" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnApps" Tag="Apps" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnBloatwares" Tag="Bloatwares" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnExtreme" Tag="Extreme" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnInnovations" Tag="Innovations" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnAudio" Tag="Audio" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnNiveaux" Tag="Niveaux" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    
                    <Border BorderBrush="#2A2A3A" BorderThickness="1" CornerRadius="5" Margin="0,12,0,12" Padding="8">
                        <StackPanel>
                            <TextBlock Name="TxtQuickSelect" FontSize="10" FontWeight="Bold" Foreground="#00FFC8" Margin="0,0,0,6" HorizontalAlignment="Center"/>
                            <Button Name="BtnSelectSafe" Height="25" Background="#161622" Foreground="#F5F5FA" FontSize="11" BorderThickness="0" Margin="0,2"/>
                            <Button Name="BtnSelectMod" Height="25" Background="#161622" Foreground="#F1C40F" FontSize="11" BorderThickness="0" Margin="0,2"/>
                            <Button Name="BtnSelectAdv" Height="25" Background="#161622" Foreground="#E74C3C" FontSize="11" BorderThickness="0" Margin="0,2"/>
                            <Button Name="BtnClearAll" Height="25" Background="#221616" Foreground="#E74C3C" FontSize="11" BorderThickness="0" Margin="0,4,0,0"/>
                        </StackPanel>
                    </Border>

                    <UniformGrid Columns="2" Margin="0,0,0,8">
                        <Button Name="BtnSaveProfile" Height="28" Background="#161622" Foreground="#00FFC8" BorderThickness="0" FontSize="10" Margin="0,0,2,0"/>
                        <Button Name="BtnLoadProfile" Height="28" Background="#161622" Foreground="#00FFC8" BorderThickness="0" FontSize="10" Margin="2,0,0,0"/>
                    </UniformGrid>
                    <Button Name="BtnRestore" Height="32" Background="#161622" Foreground="#00FFC8" BorderThickness="0" Margin="0,0,0,8"/>
                    <Button Name="BtnShortcut" Height="32" Background="#161622" Foreground="#7C9CFF" BorderThickness="0" Margin="0,0,0,12"/>
                    
                    <Border BorderBrush="#2A2A3A" BorderThickness="1" CornerRadius="5" Margin="0,0,0,12" Padding="8" Background="#0C0C12">
                        <StackPanel>
                            <TextBlock Name="TxtRamCleanerTitle" FontSize="9" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,6"/>
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,0,0,8">
                                <TextBlock Name="TxtRamPercent" Text="-- %" FontSize="18" FontWeight="Bold" Foreground="#F5F5FA"/>
                                <TextBlock Name="TxtRamUsedLabel" Text=" utilisé" FontSize="10" Foreground="#707080" VerticalAlignment="Bottom" Margin="3,0,0,2"/>
                            </StackPanel>
                            <Button Name="BtnCleanRam" Height="25" Background="#161622" Foreground="#00FFC8" FontSize="11" BorderThickness="0"/>
                        </StackPanel>
                    </Border>

                    <TextBlock Text="LANGUAGE / LANGUE" FontSize="9" Foreground="#505060" Margin="5,0,0,2" HorizontalAlignment="Left"/>
                    <ComboBox Name="ComboLang" Height="25" Background="#161622" Foreground="Black" Margin="0,0,0,10">
                        <ComboBoxItem Content="Français (FR)" IsSelected="True"/>
                        <ComboBoxItem Content="English (EN)"/>
                    </ComboBox>

                    <TextBlock Text="AFFICHAGE / DISPLAY" FontSize="9" Foreground="#505060" Margin="5,0,0,2" HorizontalAlignment="Left"/>
                    <ComboBox Name="ComboDensity" Height="25" Background="#161622" Foreground="Black">
                        <ComboBoxItem Content="Détaillé (confortable)" IsSelected="True"/>
                        <ComboBoxItem Content="Compact (plus de tweaks visibles)"/>
                    </ComboBox>
                </StackPanel>
            </ScrollViewer>
        </Grid>
        
        <Grid Grid.Column="1" Margin="20">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/> <RowDefinition Height="Auto"/> <RowDefinition Height="Auto"/> <RowDefinition Height="Auto"/> <RowDefinition Height="*"/>    <RowDefinition Height="130"/>  <RowDefinition Height="Auto"/> <RowDefinition Height="55"/>   </Grid.RowDefinitions>
            
            <StackPanel Grid.Row="0" Orientation="Horizontal" Margin="2,0,0,14">
                <TextBlock Name="TxtCategoryIcon" Text="🌐" FontSize="22" Margin="0,0,10,0" VerticalAlignment="Center"/>
                <StackPanel>
                    <TextBlock Name="TxtCategoryTitle" Text="RÉSEAU" FontSize="22" FontWeight="Bold" Foreground="#F5F5FA"/>
                    <TextBlock Name="TxtCategoryCount" Text="" FontSize="11" Foreground="#606070"/>
                </StackPanel>
            </StackPanel>
            
            <Border Grid.Row="1" Background="#101016" CornerRadius="5" Padding="12" Margin="0,0,0,15" BorderBrush="#1C1C28" BorderThickness="1">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="2*"/>
                        <ColumnDefinition Width="2*"/>
                        <ColumnDefinition Width="1*"/>
                    </Grid.ColumnDefinitions>
                    <StackPanel Grid.Column="0" Margin="0,0,10,0">
                        <TextBlock Name="DiagCpuLabel" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
                        <TextBlock Name="DiagCpuVal" FontSize="11" Foreground="#00FFC8" TextWrapping="NoWrap" TextTrimming="CharacterEllipsis"/>
                    </StackPanel>
                    <StackPanel Grid.Column="1" Margin="0,0,10,0">
                        <TextBlock Name="DiagGpuLabel" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
                        <TextBlock Name="DiagGpuVal" FontSize="11" Foreground="#00FFC8" TextWrapping="NoWrap" TextTrimming="CharacterEllipsis"/>
                    </StackPanel>
                    <StackPanel Grid.Column="2">
                        <TextBlock Name="DiagRamLabel" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
                        <TextBlock Name="DiagRamVal" FontSize="11" Foreground="#00FFC8"/>
                    </StackPanel>
                </Grid>
            </Border>
            
            <Grid Grid.Row="2" Margin="0,0,0,10">
                <TextBox Name="TxtSearch" Height="28" Background="#161622" Foreground="#DCDCE6" BorderBrush="#2A2A3A" BorderThickness="1" Padding="25,4,5,4" FontSize="12"/>
                <TextBlock Text="🔍" Foreground="#505060" FontSize="11" HorizontalAlignment="Left" VerticalAlignment="Center" Margin="8,0,0,0" IsHitTestVisible="False"/>
            </Grid>

            <Border Name="RamTweakPanel" Grid.Row="3" Background="#161622" CornerRadius="5" Padding="15" Margin="0,0,0,15" BorderBrush="#2A2A3A" BorderThickness="1" Visibility="Collapsed">
                <StackPanel>
                    <TextBlock Text="⚙️ OPTIMISEUR DE CRÉATION DE PROCESSUS (SvcHostSplitThresholdInKB)" Foreground="#00FFC8" FontSize="12" FontWeight="Bold" Margin="0,0,0,5"/>
                    <TextBlock Text="Indiquez votre quantité de RAM physique installée. Le toolkit calculera et ajustera au registre le split svchost optimal pour éviter l'éparpillement inutile des processus ou améliorer l'isolation de sécurité." Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap" Margin="0,0,0,10"/>
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="200"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>
                        <ComboBox Name="ComboSvcHostRam" Grid.Column="0" Height="28" Background="#101016" Foreground="Black">
                            <ComboBoxItem Content="Défaut Windows" Tag="380000"/>
                            <ComboBoxItem Content="4 Go RAM (4194304)" Tag="4194304"/>
                            <ComboBoxItem Content="6 Go RAM (6291456)" Tag="6291456"/>
                            <ComboBoxItem Content="8 Go RAM (8388608)" Tag="8388608"/>
                            <ComboBoxItem Content="12 Go RAM (12582912)" Tag="12582912"/>
                            <ComboBoxItem Content="16 Go RAM (16777216)" Tag="16777216"/>
                            <ComboBoxItem Content="24 Go RAM (25165824)" Tag="25165824"/>
                            <ComboBoxItem Content="32 Go RAM (33554432)" Tag="33554432"/>
                            <ComboBoxItem Content="64 Go RAM (67108864)" Tag="67108864"/>
                        </ComboBox>
                        <TextBlock Name="TxtSvcHostStatus" Grid.Column="1" Foreground="#F1C40F" FontSize="11" VerticalAlignment="Center" Margin="15,0,0,0" Text="Prêt à configurer."/>
                    </Grid>
                </StackPanel>
            </Border>
            
            <ScrollViewer Grid.Row="4" VerticalScrollBarVisibility="Auto">
                <StackPanel Name="OptionsPanel" Margin="10,0"/>
            </ScrollViewer>
            
            <TextBox Name="LogBox" Grid.Row="5" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"
                     FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
            
            <Grid Grid.Row="6" Margin="0,10,0,0">
                <ProgressBar Name="ProgressBarApply" Height="18" Minimum="0" Maximum="1" Value="0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"/>
                <TextBlock Name="TxtProgressLabel" Text="" Foreground="#0A0A0E" FontSize="10" FontWeight="Bold" HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Grid>
            
            <Button Name="BtnApply" Grid.Row="7" Margin="0,10,0,0"
                    Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

$Reader = New-Object System.Xml.XmlNodeReader $XAML
$Form = [Windows.Markup.XamlReader]::Load($Reader)

# Récupération des contrôles WPF
$Panel = $Form.FindName("OptionsPanel")
$TxtCategoryIcon = $Form.FindName("TxtCategoryIcon")
$TxtCategoryTitle = $Form.FindName("TxtCategoryTitle")
$TxtCategoryCount = $Form.FindName("TxtCategoryCount")
$TxtMainTitle = $Form.FindName("TxtMainTitle")
$TxtSubtitle = $Form.FindName("TxtSubtitle")
$TxtLegend = $Form.FindName("TxtLegend")
$LogBox = $Form.FindName("LogBox")
$BtnApply = $Form.FindName("BtnApply")
$ProgressBarApply = $Form.FindName("ProgressBarApply")
$TxtProgressLabel = $Form.FindName("TxtProgressLabel")
$BtnRestore = $Form.FindName("BtnRestore")
$BtnShortcut = $Form.FindName("BtnShortcut")
$ComboLang = $Form.FindName("ComboLang")
$ComboDensity = $Form.FindName("ComboDensity")
$Global:Density = "Detailed"

$TxtQuickSelect = $Form.FindName("TxtQuickSelect")
$BtnSelectSafe = $Form.FindName("BtnSelectSafe")
$BtnSelectMod = $Form.FindName("BtnSelectMod")
$BtnSelectAdv = $Form.FindName("BtnSelectAdv")
$BtnClearAll = $Form.FindName("BtnClearAll")

$BtnSaveProfile = $Form.FindName("BtnSaveProfile")
$BtnLoadProfile = $Form.FindName("BtnLoadProfile")
$TxtRamCleanerTitle = $Form.FindName("TxtRamCleanerTitle")
$TxtRamPercent = $Form.FindName("TxtRamPercent")
$TxtRamUsedLabel = $Form.FindName("TxtRamUsedLabel")
$BtnCleanRam = $Form.FindName("BtnCleanRam")
$TxtSearch = $Form.FindName("TxtSearch")

$DiagCpuLabel = $Form.FindName("DiagCpuLabel")
$DiagCpuVal = $Form.FindName("DiagCpuVal")
$DiagGpuLabel = $Form.FindName("DiagGpuLabel")
$DiagGpuVal = $Form.FindName("DiagGpuVal")
$DiagRamLabel = $Form.FindName("DiagRamLabel")
$DiagRamVal = $Form.FindName("DiagRamVal")

# Nouveaux éléments du module RAM
$RamTweakPanel = $Form.FindName("RamTweakPanel")
$ComboSvcHostRam = $Form.FindName("ComboSvcHostRam")
$TxtSvcHostStatus = $Form.FindName("TxtSvcHostStatus")

$DiagCpuVal.Text = $CpuName
$DiagGpuVal.Text = $GpuName
$DiagRamVal.Text = "$TotalRamGB Go"

$NavButtons = @{
    "Reseau"=$Form.FindName("BtnReseau")
    "Confidentialite"=$Form.FindName("BtnConfidentialite")
    "Gaming"=$Form.FindName("BtnGaming")
    "Processus"=$Form.FindName("BtnProcessus")
    "Timer"=$Form.FindName("BtnTimer")
    "Power"=$Form.FindName("BtnPower")
    "Services"=$Form.FindName("BtnServices")
    "Nettoyage"=$Form.FindName("BtnNettoyage")
    "Apps"=$Form.FindName("BtnApps")
    "Bloatwares"=$Form.FindName("BtnBloatwares")
    "Extreme"=$Form.FindName("BtnExtreme")
    "Innovations"=$Form.FindName("BtnInnovations")
    "Audio"=$Form.FindName("BtnAudio")
    "Niveaux"=$Form.FindName("BtnNiveaux")
}

$Global:LogHistory = [System.Collections.Generic.List[string]]::new()
$Global:CheckStates = @{}
foreach ($o in $Options) { $Global:CheckStates[$o.Id] = $false }

# ============================================================
# AUTO-DETECTION DE L'ETAT ACTUEL AU DEMARRAGE
# ============================================================
# Uniquement pour les tweaks annotes (CheckType Reg ou Svc). Les autres
# (installations, netsh, powercfg, DISM...) restent decoches par defaut,
# car il n'existe pas de moyen fiable de verifier leur etat.
$Global:AutoCheckCount = 0
foreach ($o in $Options) {
    if ($null -ne $o.CheckType) {
        $result = Test-TweakApplied $o
        if ($result -eq $true) {
            $Global:CheckStates[$o.Id] = $true
            $Global:AutoCheckCount++
        }
    }
}
$Global:SelectedSvcHostValue = "380000" # Valeur par défaut de Windows
$Global:LastCategory = "Reseau"

# ============================================================
# RUNSPACE EN ARRIÈRE-PLAN (exécution asynchrone des tweaks)
# ============================================================
# On ouvre UN SEUL runspace de fond, reutilise sequentiellement pour chaque
# tweak. Ca evite de figer l'interface WPF pendant les operations lentes
# (winget, DISM, netsh) sans la complexite d'un vrai pool multi-thread.
$Global:BgRunspace = [runspacefactory]::CreateRunspace()
$Global:BgRunspace.Open()

# On recupere le code source reel de nos fonctions utilitaires pour les
# injecter telles quelles dans le runspace de fond (elles n'existent pas
# la-bas par defaut). Write-Log est remplace par une version muette car
# le LogBox WPF ne peut etre touche que depuis le thread de l'interface.
$Global:BgFunctionsText = @"
function Set-Reg { $((Get-Command Set-Reg).Definition) }
function Remove-Reg { $((Get-Command Remove-Reg).Definition) }
function Disable-Svc { $((Get-Command Disable-Svc).Definition) }
function Install-WingetApp { $((Get-Command Install-WingetApp).Definition) }
function Uninstall-Appx { $((Get-Command Uninstall-Appx).Definition) }
function Set-SystemTimerResolution { $((Get-Command Set-SystemTimerResolution).Definition) }
function Write-Log { param(`$k, `$s = `$false) }
"@

$Global:ApplyQueue = [System.Collections.Generic.Queue[object]]::new()
$Global:ApplyTotal = 0
$Global:ApplyDone = 0
$Global:CurrentPS = $null
$Global:CurrentAsync = $null

$ApplyTimer = New-Object System.Windows.Threading.DispatcherTimer
$ApplyTimer.Interval = [TimeSpan]::FromMilliseconds(150)
$ApplyTimer.Add_Tick({
    # Un tweak est deja en cours d'execution en arriere-plan : on regarde s'il est termine.
    if ($null -ne $Global:CurrentPS) {
        if ($Global:CurrentAsync.IsCompleted) {
            $item = $Global:CurrentItem
            $label = if ($Global:CurrentLang -eq "FR") { $item.LabelFR } else { $item.LabelEN }
            try {
                $Global:CurrentPS.EndInvoke($Global:CurrentAsync) | Out-Null
                if ($Global:CurrentPS.HadErrors) {
                    $errRecords = @($Global:CurrentPS.Streams.Error)
                    if ($errRecords.Count -gt 0) {
                        $errText = $errRecords[0].ToString()
                        $LogBox.AppendText(">> [ECHEC] $label -> $errText`n")
                    } else {
                        # HadErrors=true mais aucune erreur detaillee (frequent avec
                        # -ErrorAction SilentlyContinue sur des fichiers verrouilles) :
                        # l'action a globalement reussi, on ne panique pas pour rien.
                        $LogBox.AppendText(">> [OK] $label`n")
                    }
                } else {
                    $LogBox.AppendText(">> [OK] $label`n")
                }
            } catch {
                $realMsg = if ($_.Exception.InnerException) { $_.Exception.InnerException.Message } else { $_.Exception.Message }
                $LogBox.AppendText(">> [ECHEC] $label -> $realMsg`n")
            }
            $Global:CurrentPS.Dispose()
            $Global:CurrentPS = $null
            $Global:CurrentAsync = $null
            $Global:ApplyDone++
            $ProgressBarApply.Value = $Global:ApplyDone
            $TxtProgressLabel.Text = "$($Global:ApplyDone) / $($Global:ApplyTotal)"
            $LogBox.ScrollToEnd()
        } else {
            return # toujours en cours, on attend le prochain tick
        }
    }

    # Rien en cours : on lance le prochain tweak de la file, s'il y en a un.
    if ($Global:ApplyQueue.Count -gt 0) {
        $next = $Global:ApplyQueue.Dequeue()
        $Global:CurrentItem = $next
        $scriptText = $Global:BgFunctionsText + "`n" + $next.Action.ToString()
        $ps = [PowerShell]::Create()
        $ps.Runspace = $Global:BgRunspace
        [void]$ps.AddScript($scriptText)
        $Global:CurrentPS = $ps
        $Global:CurrentAsync = $ps.BeginInvoke()
    } elseif ($Global:ApplyTotal -gt 0) {
        # File vide et rien en cours : on a fini.
        $ApplyTimer.Stop()
        $L = $Global:LangDict[$Global:CurrentLang]
        $LogBox.AppendText(">> $($L["Done"])`n")
        $LogBox.ScrollToEnd()
        [System.Windows.MessageBox]::Show($L["BoxDone"], "OPTI-DYLAN")
        $BtnApply.IsEnabled = $true
        $Global:ApplyTotal = 0
    }
})

# ============================================================
# NETTOYAGE ET MISE À JOUR DE LA RAM REELLE
# ============================================================
$RamTimer = New-Object System.Windows.Threading.DispatcherTimer
$RamTimer.Interval = [TimeSpan]::FromSeconds(2)
$RamTimer.Add_Tick({
    $os = Get-CimInstance Win32_OperatingSystem
    $pct = [Math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 0)
    $TxtRamPercent.Text = "$pct %"
})
$RamTimer.Start()

$BtnCleanRam.Add_Click({
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    $os = Get-CimInstance Win32_OperatingSystem
    $pct = [Math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 0)
    $TxtRamPercent.Text = "$pct %"
    Write-Log "RAM optimisée et cache libéré." $false
})

# ============================================================
# LOGIQUE ET REPARATION DE LA SAUVEGARDE DES PROFILS
# ============================================================
$ProfileDir = Join-Path $env:APPDATA "OPTI-DYLAN"
if (-not (Test-Path $ProfileDir)) { New-Item -Path $ProfileDir -ItemType Directory -Force | Out-Null }
$ProfilePath = Join-Path $ProfileDir "opti_profile.json"

$BtnSaveProfile.Add_Click({
    try {
        # CORRECTIF V15.1 : ConvertTo-Json refuse les Hashtable dont les cles ne
        # sont pas des chaines de caracteres. Nos IDs sont des entiers, donc on
        # reconstruit un dictionnaire avec des cles texte avant serialisation.
        $CheckStatesForSave = @{}
        foreach ($k in $Global:CheckStates.Keys) {
            $CheckStatesForSave["$k"] = $Global:CheckStates[$k]
        }
        $SaveObject = @{
            "CheckStates" = $CheckStatesForSave
            "SvcHostValue" = $Global:SelectedSvcHostValue
        }
        $Json = $SaveObject | ConvertTo-Json -Depth 5
        [System.IO.File]::WriteAllText($ProfilePath, $Json)
        Write-Log "ProfileSaved"
    } catch {
        Write-Log "[ERR] Sauvegarde échouée: $($_.Exception.Message)" $false
    }
})

$BtnLoadProfile.Add_Click({
    if (Test-Path $ProfilePath) {
        try {
            $Loaded = Get-Content $ProfilePath -Raw | ConvertFrom-Json
            
            # Restauration sécurisée des états cochés
            if ($null -ne $Loaded.CheckStates) {
                foreach ($prop in $Loaded.CheckStates.PSObject.Properties) {
                    $id = [int]$prop.Name
                    $Global:CheckStates[$id] = [bool]$prop.Value
                }
            }
            
            # Restauration de la valeur SvcHost
            if ($null -ne $Loaded.SvcHostValue) {
                $Global:SelectedSvcHostValue = $Loaded.SvcHostValue
                # Resynchroniser le ComboBox visuellement
                $indexToSelect = 0
                for ($i = 0; $i -lt $ComboSvcHostRam.Items.Count; $i++) {
                    if ($ComboSvcHostRam.Items[$i].Tag -eq $Global:SelectedSvcHostValue) {
                        $indexToSelect = $i
                        break
                    }
                }
                $ComboSvcHostRam.SelectedIndex = $indexToSelect
            }
            
            Render-Category $Global:LastCategory
            Update-SidebarCounters
            Write-Log "ProfileLoaded"
        } catch {
            Write-Log "[ERR] Erreur lors de la lecture du fichier : $($_.Exception.Message)" $false
        }
    } else {
        Write-Log "ProfileErr"
    }
})

# ============================================================
# SÉLECTION DE LA VALEUR DE SVCHOST
# ============================================================
$ComboSvcHostRam.Add_SelectionChanged({
    $selectedItem = $ComboSvcHostRam.SelectedItem
    if ($null -ne $selectedItem) {
        $Global:SelectedSvcHostValue = $selectedItem.Tag
        $TxtSvcHostStatus.Text = "Prêt à appliquer : $($selectedItem.Content)"
    }
})

# ============================================================
# AFFICHAGE LOGS ET NAVIGATION
# ============================================================
function Write-Log([string]$KeyOrText, [bool]$IsStaticKey = $true) {
    if ($IsStaticKey) {
        if (-not $Global:LogHistory.Contains($KeyOrText)) { $Global:LogHistory.Add($KeyOrText) }
    } else {
        $Global:LogHistory.Add($KeyOrText)
    }
    Refresh-LogBoxDisplay
}

function Refresh-LogBoxDisplay {
    $LogBox.Clear()
    $L = $Global:LangDict[$Global:CurrentLang]
    foreach ($logKey in $Global:LogHistory) {
        if ($logKey -match "^([A-Za-z]+)\|(.+)$" -and $L.ContainsKey($Matches[1])) {
            $LogBox.AppendText(">> $($L[$Matches[1]] -f $Matches[2])`n")
        } elseif ($L.ContainsKey($logKey)) {
            $LogBox.AppendText(">> $($L[$logKey])`n")
        } else {
            $LogBox.AppendText(">> $logKey`n")
        }
    }
    $LogBox.ScrollToEnd()
}

function Get-CategoryDisplayName([string]$Key) {
    $L = $Global:LangDict[$Global:CurrentLang]
    switch ($Key) {
        "Reseau" { return $L["CatReseau"] }
        "Confidentialite" { return $L["CatConfidentialite"] }
        "Gaming" { return $L["CatGaming"] }
        "Processus" { return $L["CatProcessus"] }
        "Timer" { return $L["CatTimer"] }
        "Power" { return $L["CatPower"] }
        "Services" { return $L["CatServices"] }
        "Nettoyage" { return $L["CatNettoyage"] }
        "Apps" { return $L["CatApps"] }
        "Bloatwares" { return $L["CatBloatwares"] }
        "Extreme" { return $L["CatExtreme"] }
        "Audio" { return $L["CatAudio"] }
        "Niveaux" { return $L["CatNiveaux"] }
        "Innovations" { return $L["CatInnovations"] }
    }
}

function Get-CategoryEmoji([string]$Key) {
    switch ($Key) {
        "Reseau" { return "🌐" }
        "Confidentialite" { return "🛡️" }
        "Gaming" { return "🎮" }
        "Processus" { return "💻" }
        "Timer" { return "⏱️" }
        "Power" { return "⚡" }
        "Services" { return "⚙️" }
        "Nettoyage" { return "🧹" }
        "Apps" { return "📦" }
        "Bloatwares" { return "🗑️" }
        "Extreme" { return "🔥" }
        "Innovations" { return "🚀" }
        "Audio" { return "🎙️" }
        "Niveaux" { return "🔻" }
    }
}

function Update-SidebarCounters {
    foreach ($key in $NavButtons.Keys) {
        $count = ($Options | Where-Object { $_.Cat -eq $key -and $Global:CheckStates[$_.Id] -eq $true }).Count
        $catTitle = Get-CategoryDisplayName $key
        $emoji = Get-CategoryEmoji $key
        if ($count -gt 0) {
            $NavButtons[$key].Content = "$emoji  $catTitle ($count)"
        } else {
            $NavButtons[$key].Content = "$emoji  $catTitle"
        }
    }
    if ($null -ne $TxtCategoryCount -and $Global:LastCategory) {
        $totalInCat = ($Options | Where-Object { $_.Cat -eq $Global:LastCategory }).Count
        $checkedInCat = ($Options | Where-Object { $_.Cat -eq $Global:LastCategory -and $Global:CheckStates[$_.Id] -eq $true }).Count
        if ($Global:CurrentLang -eq "FR") {
            $TxtCategoryCount.Text = "$totalInCat tweak(s) disponible(s) — $checkedInCat coché(s)"
        } else {
            $TxtCategoryCount.Text = "$totalInCat tweak(s) available — $checkedInCat checked"
        }
    }
}

function Update-ShortcutButtonLabel {
    if (Test-DesktopShortcutInstalled) {
        $BtnShortcut.Content = if ($Global:CurrentLang -eq "FR") { "✅ Raccourci Bureau créé" } else { "✅ Desktop shortcut created" }
    } else {
        $BtnShortcut.Content = if ($Global:CurrentLang -eq "FR") { "🖥️ Créer un raccourci Bureau" } else { "🖥️ Create Desktop Shortcut" }
    }
}

function Update-InterfaceLanguage {
    $L = $Global:LangDict[$Global:CurrentLang]
    
    $TxtMainTitle.Text = $L["Title"]
    $TxtSubtitle.Text = $L["Subtitle"]
    $TxtLegend.Text = $L["Legend"]
    $BtnApply.Content = $L["BtnApply"]
    $BtnRestore.Content = $L["BtnRestore"]
    Update-ShortcutButtonLabel
    
    $TxtQuickSelect.Text = $L["QuickSelect"]
    $BtnSelectSafe.Content = $L["BtnSelectSafe"]
    $BtnSelectMod.Content = $L["BtnSelectMod"]
    $BtnSelectAdv.Content = $L["BtnSelectAdv"]
    $BtnClearAll.Content = $L["BtnClearAll"]
    
    $BtnSaveProfile.Content = $L["BtnSaveProfile"]
    $BtnLoadProfile.Content = $L["BtnLoadProfile"]
    $TxtRamCleanerTitle.Text = $L["RamCleanerTitle"]
    $TxtRamUsedLabel.Text = $L["RamUsed"]
    $BtnCleanRam.Content = $L["BtnCleanRam"]
    
    $DiagCpuLabel.Text = $L["Cpu"].ToUpper()
    $DiagGpuLabel.Text = $L["Gpu"].ToUpper()
    $DiagRamLabel.Text = $L["Ram"].ToUpper()
    
    $TxtSearch.Text = ""
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Refresh-LogBoxDisplay
}

function Render-Category([string]$Cat) {
    try {
        $Global:LastCategory = $Cat
        $Panel.Children.Clear()

        $TxtCategoryIcon.Text = Get-CategoryEmoji $Cat
        $TxtCategoryTitle.Text = (Get-CategoryDisplayName $Cat).ToUpper()
        $totalInCat = ($Options | Where-Object { $_.Cat -eq $Cat }).Count
        $checkedInCat = ($Options | Where-Object { $_.Cat -eq $Cat -and $Global:CheckStates[$_.Id] -eq $true }).Count
        if ($Global:CurrentLang -eq "FR") {
            $TxtCategoryCount.Text = "$totalInCat tweak(s) disponible(s) — $checkedInCat coché(s)"
        } else {
            $TxtCategoryCount.Text = "$totalInCat tweak(s) available — $checkedInCat checked"
        }
        
        # Afficher le module RAM uniquement dans la section "Processus"
        if ($Cat -eq "Processus") {
            $RamTweakPanel.Visibility = [System.Windows.Visibility]::Visible
        } else {
            $RamTweakPanel.Visibility = [System.Windows.Visibility]::Collapsed
        }

        if ($Cat -eq "Niveaux") {
            $LvlBox = New-Object System.Windows.Controls.Border
            $LvlBox.Background = Get-Brush "#161622"
            $LvlBox.BorderBrush = Get-Brush "#2A2A3A"
            $LvlBox.BorderThickness = "1"
            $LvlBox.CornerRadius = "6"
            $LvlBox.Padding = "18"
            $LvlBox.Margin = "0,0,0,15"
            $LvlStack = New-Object System.Windows.Controls.StackPanel

            $LvlTitle = New-Object System.Windows.Controls.TextBlock
            $LvlTitle.Text = if ($Global:CurrentLang -eq "FR") { "Réducteur de processus (5 niveaux)" } else { "Process reducer (5 levels)" }
            $LvlTitle.Foreground = Get-Brush "#00FFC8"
            $LvlTitle.FontSize = 15
            $LvlTitle.FontWeight = "Bold"
            $LvlTitle.Margin = "0,0,0,4"
            [void]$LvlStack.Children.Add($LvlTitle)

            $LvlSub = New-Object System.Windows.Controls.TextBlock
            $LvlSub.Text = if ($Global:CurrentLang -eq "FR") { "Glisse le curseur, clique Appliquer. De ~100 processus au demarrage (standard) a ~50 (extreme)." } else { "Drag the slider, click Apply. From ~100 startup processes (standard) to ~50 (extreme)." }
            $LvlSub.Foreground = Get-Brush "#A0A0A0"
            $LvlSub.FontSize = 11
            $LvlSub.TextWrapping = "Wrap"
            $LvlSub.Margin = "0,0,0,14"
            [void]$LvlStack.Children.Add($LvlSub)

            $LvlSlider = New-Object System.Windows.Controls.Slider
            $LvlSlider.Minimum = 1
            $LvlSlider.Maximum = 5
            $LvlSlider.TickFrequency = 1
            $LvlSlider.IsSnapToTickEnabled = $true
            $LvlSlider.Value = 1
            $LvlSlider.Margin = "0,0,0,10"
            [void]$LvlStack.Children.Add($LvlSlider)

            $LvlLabels = @{
                1 = @{FR="Niveau 1 : Standard (~100 processus) - aucune modification supplementaire."; EN="Level 1: Standard (~100 processes) - no additional change."}
                2 = @{FR="Niveau 2 : Leger (~90 processus) - apps Store en arriere-plan, OneDrive, Cortana au demarrage."; EN="Level 2: Light (~90 processes) - background Store apps, OneDrive, Cortana at startup."}
                3 = @{FR="Niveau 3 : Optimise (~75 processus) - + DiagTrack, regroupement svchost leger (8 Go)."; EN="Level 3: Optimized (~75 processes) - + DiagTrack, light svchost grouping (8 GB)."}
                4 = @{FR="Niveau 4 : Ultra (~60 processus) - + dmwappush, SysMain, PcaSvc, MapsBroker, WerSvc, svchost 16 Go."; EN="Level 4: Ultra (~60 processes) - + dmwappush, SysMain, PcaSvc, MapsBroker, WerSvc, svchost 16 GB."}
                5 = @{FR="Niveau 5 : EXTREME (~50-70 processus selon ta version de Windows) - + Xbox, Widgets, WSearch, Fax, RemoteRegistry, Bluetooth, Spouleur, svchost 64 Go (maximum disponible). Windows a durci le regroupement au fil des mises a jour : sur un Windows 11 recent, ~50 n'est plus garanti meme avec ce reglage au maximum."; EN="Level 5: EXTREME (~50-70 processes depending on your Windows version) - + Xbox, Widgets, WSearch, Fax, RemoteRegistry, Bluetooth, Spooler, svchost 64 GB (max available). Windows has hardened grouping over updates: on a recent Windows 11, ~50 is no longer guaranteed even at this max setting."}
            }
            $LvlDesc = New-Object System.Windows.Controls.TextBlock
            $LvlDesc.Text = if ($Global:CurrentLang -eq "FR") { $LvlLabels[1].FR } else { $LvlLabels[1].EN }
            $LvlDesc.Foreground = Get-Brush "#F5F5FA"
            $LvlDesc.FontSize = 12
            $LvlDesc.FontWeight = "Bold"
            $LvlDesc.TextWrapping = "Wrap"
            $LvlDesc.Margin = "0,0,0,14"
            [void]$LvlStack.Children.Add($LvlDesc)

            $LvlSlider.Add_ValueChanged({
                $lvl = [int]$this.Value
                $LvlDesc.Text = if ($Global:CurrentLang -eq "FR") { $LvlLabels[$lvl].FR } else { $LvlLabels[$lvl].EN }
            }.GetNewClosure())

            $BtnApplyLevel = New-Object System.Windows.Controls.Button
            $BtnApplyLevel.Content = if ($Global:CurrentLang -eq "FR") { "Appliquer ce niveau" } else { "Apply this level" }
            $BtnApplyLevel.Height = 32
            $BtnApplyLevel.Width = 200
            $BtnApplyLevel.HorizontalAlignment = "Left"
            $BtnApplyLevel.Background = Get-Brush "#00FFC8"
            $BtnApplyLevel.Foreground = Get-Brush "#0A0A0E"
            $BtnApplyLevel.FontWeight = "Bold"
            $BtnApplyLevel.BorderThickness = "0"
            $BtnApplyLevel.Add_Click({
                Set-ProcessReductionLevel ([int]$LvlSlider.Value)
            }.GetNewClosure())
            [void]$LvlStack.Children.Add($BtnApplyLevel)

            $LvlNote = New-Object System.Windows.Controls.TextBlock
            $LvlNote.Text = if ($Global:CurrentLang -eq "FR") { "Reutilise les options existantes (Confidentialite/Services/Bloatwares) et le seuil SvcHost de la categorie Processus -- rien n'est duplique. Clic = application reelle immediate. Le regroupement svchost n'a un effet visible dans le Gestionnaire des taches qu'apres redemarrage." } else { "Reuses existing options (Confidentialite/Services/Bloatwares) and the Processus category's SvcHost threshold - nothing is duplicated. Click = real, immediate application. The svchost grouping only shows up in Task Manager after a restart." }
            $LvlNote.Foreground = Get-Brush "#6A6A7A"
            $LvlNote.FontSize = 10
            $LvlNote.TextWrapping = "Wrap"
            $LvlNote.Margin = "14,0,0,0"
            [void]$LvlStack.Children.Add($LvlNote)

            $LvlBox.Child = $LvlStack
            [void]$Panel.Children.Add($LvlBox)
        }

        if ($Cat -eq "Audio") {
            if ($Global:AudioEngineError) {
                $ErrBox = New-Object System.Windows.Controls.Border
                $ErrBox.Background = Get-Brush "#2A1616"
                $ErrBox.BorderBrush = Get-Brush "#E74C3C"
                $ErrBox.BorderThickness = "1"
                $ErrBox.CornerRadius = "5"
                $ErrBox.Padding = "12"
                $ErrBox.Margin = "0,0,0,12"
                $ErrText = New-Object System.Windows.Controls.TextBlock
                $ErrText.Text = if ($Global:CurrentLang -eq "FR") { "Le moteur micro n'a pas compile au demarrage : $($Global:AudioEngineError)  Le Vu-metre ne fonctionnera pas, mais VST et Sound Radar restent utilisables (ils ne dependent pas de ce moteur)." } else { "The microphone engine failed to compile at startup: $($Global:AudioEngineError)  The VU meter will not work, but VST and Sound Radar remain usable (they do not depend on this engine)." }
                $ErrText.Foreground = Get-Brush "#E74C3C"
                $ErrText.FontSize = 11
                $ErrText.TextWrapping = "Wrap"
                $ErrBox.Child = $ErrText
                [void]$Panel.Children.Add($ErrBox)
            }

            # --- Statut Equalizer APO ---
            $EqBox = New-Object System.Windows.Controls.Border
            $EqBox.Background = Get-Brush "#161622"
            $EqBox.BorderBrush = Get-Brush "#2A2A3A"
            $EqBox.BorderThickness = "1"
            $EqBox.CornerRadius = "5"
            $EqBox.Padding = "12"
            $EqBox.Margin = "0,0,0,12"
            $EqStack = New-Object System.Windows.Controls.StackPanel

            $eqInstalled = Test-EqualizerApoInstalled
            $EqTitle = New-Object System.Windows.Controls.TextBlock
            if ($eqInstalled) {
                $EqTitle.Text = if ($Global:CurrentLang -eq "FR") { "Equalizer APO : installe" } else { "Equalizer APO: installed" }
                $EqTitle.Foreground = Get-Brush "#2ECC71"
            } else {
                $EqTitle.Text = if ($Global:CurrentLang -eq "FR") { "Equalizer APO : non installe" } else { "Equalizer APO: not installed" }
                $EqTitle.Foreground = Get-Brush "#E74C3C"
            }
            $EqTitle.FontSize = 12
            $EqTitle.FontWeight = "Bold"
            [void]$EqStack.Children.Add($EqTitle)

            $EqDesc = New-Object System.Windows.Controls.TextBlock
            $EqDesc.Text = if ($Global:CurrentLang -eq "FR") { "Requis pour le VST et le Radar Casque. L'installeur a besoin d'un clic pour choisir ton peripherique : il n'existe pas de version 100% silencieuse pour ce logiciel precis." } else { "Required for VST and Headset Radar. The installer needs one click to pick your device: there is no 100% silent version for this specific software." }
            $EqDesc.Foreground = Get-Brush "#A0A0A0"
            $EqDesc.FontSize = 11
            $EqDesc.TextWrapping = "Wrap"
            $EqDesc.Margin = "0,4,0,8"
            [void]$EqStack.Children.Add($EqDesc)

            if (-not $eqInstalled) {
                $BtnInstallEq = New-Object System.Windows.Controls.Button
                $BtnInstallEq.Content = if ($Global:CurrentLang -eq "FR") { "Telecharger et installer" } else { "Download and install" }
                $BtnInstallEq.Height = 28
                $BtnInstallEq.Width = 200
                $BtnInstallEq.HorizontalAlignment = "Left"
                $BtnInstallEq.Background = Get-Brush "#7C9CFF"
                $BtnInstallEq.Foreground = Get-Brush "#0A0A0E"
                $BtnInstallEq.FontWeight = "Bold"
                $BtnInstallEq.BorderThickness = "0"
                $BtnInstallEq.Add_Click({
                    $ok = Install-EqualizerApoGuided
                    if ($ok) { $LogBox.AppendText(">> [OK] Equalizer APO installe`n") }
                    else { $LogBox.AppendText(">> [ECHEC] Installation Equalizer APO -> voir le log`n") }
                    $LogBox.ScrollToEnd()
                    Render-Category "Audio"
                }.GetNewClosure())
                [void]$EqStack.Children.Add($BtnInstallEq)
            }
            $EqBox.Child = $EqStack
            [void]$Panel.Children.Add($EqBox)

            # --- Vu-metre en direct ---
            $VuBox = New-Object System.Windows.Controls.Border
            $VuBox.Background = Get-Brush "#161622"
            $VuBox.BorderBrush = Get-Brush "#2A2A3A"
            $VuBox.BorderThickness = "1"
            $VuBox.CornerRadius = "5"
            $VuBox.Padding = "12"
            $VuBox.Margin = "0,0,0,12"
            $VuStack = New-Object System.Windows.Controls.StackPanel

            $VuTitle = New-Object System.Windows.Controls.TextBlock
            $VuTitle.Text = if ($Global:CurrentLang -eq "FR") { "Niveau du micro (temps reel)" } else { "Microphone level (live)" }
            $VuTitle.Foreground = Get-Brush "#00FFC8"
            $VuTitle.FontSize = 12
            $VuTitle.FontWeight = "Bold"
            $VuTitle.Margin = "0,0,0,8"
            [void]$VuStack.Children.Add($VuTitle)

            $Global:AudioVuBar = New-Object System.Windows.Controls.ProgressBar
            $Global:AudioVuBar.Minimum = 0
            $Global:AudioVuBar.Maximum = 100
            $Global:AudioVuBar.Height = 14
            $Global:AudioVuBar.Foreground = Get-Brush "#00FFC8"
            $Global:AudioVuBar.Background = Get-Brush "#101016"
            [void]$VuStack.Children.Add($Global:AudioVuBar)

            $VuBox.Child = $VuStack
            [void]$Panel.Children.Add($VuBox)

            if ($null -eq $Global:AudioVuTimer) {
                $Global:AudioVuTimer = New-Object System.Windows.Threading.DispatcherTimer
                $Global:AudioVuTimer.Interval = [TimeSpan]::FromMilliseconds(60)
                $Global:AudioVuTimer.Add_Tick({
                    if ($Global:LastCategory -eq "Audio" -and $null -ne $Global:AudioVuBar) {
                        try {
                            $lvl = [OptiDylanAudio]::GetMicrophonePeakLevel()
                            $Global:AudioVuBar.Value = [Math]::Min(100, [int]($lvl * 100))
                        } catch {}
                    }
                })
                $Global:AudioVuTimer.Start()
            }

            # --- VST via Equalizer APO ---
            $VstBox = New-Object System.Windows.Controls.Border
            $VstBox.Background = Get-Brush "#161622"
            $VstBox.BorderBrush = Get-Brush "#2A2A3A"
            $VstBox.BorderThickness = "1"
            $VstBox.CornerRadius = "5"
            $VstBox.Padding = "12"
            $VstBox.Margin = "0,0,0,12"
            $VstStack = New-Object System.Windows.Controls.StackPanel

            $VstTitle = New-Object System.Windows.Controls.TextBlock
            $VstTitle.Text = if ($Global:CurrentLang -eq "FR") { "Plugin VST sur le micro" } else { "VST plugin on the microphone" }
            $VstTitle.Foreground = Get-Brush "#00FFC8"
            $VstTitle.FontSize = 12
            $VstTitle.FontWeight = "Bold"
            $VstTitle.Margin = "0,0,0,8"
            [void]$VstStack.Children.Add($VstTitle)

            $Global:AudioVstStatusText = New-Object System.Windows.Controls.TextBlock
            $Global:AudioVstStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Aucun plugin charge." } else { "No plugin loaded." }
            $Global:AudioVstStatusText.Foreground = Get-Brush "#A0A0A0"
            $Global:AudioVstStatusText.FontSize = 11
            $Global:AudioVstStatusText.TextWrapping = "Wrap"
            $Global:AudioVstStatusText.Margin = "0,0,0,8"
            [void]$VstStack.Children.Add($Global:AudioVstStatusText)

            $VstBtnRow = New-Object System.Windows.Controls.StackPanel
            $VstBtnRow.Orientation = "Horizontal"

            $BtnBrowseVst = New-Object System.Windows.Controls.Button
            $BtnBrowseVst.Content = if ($Global:CurrentLang -eq "FR") { "Choisir un .dll" } else { "Choose a .dll" }
            $BtnBrowseVst.Height = 28
            $BtnBrowseVst.Width = 150
            $BtnBrowseVst.Margin = "0,0,10,0"
            $BtnBrowseVst.Background = Get-Brush "#00FFC8"
            $BtnBrowseVst.Foreground = Get-Brush "#0A0A0E"
            $BtnBrowseVst.FontWeight = "Bold"
            $BtnBrowseVst.BorderThickness = "0"
            $BtnBrowseVst.Add_Click({
                if (-not (Test-EqualizerApoInstalled)) {
                    $Global:AudioVstStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Installe d'abord Equalizer APO ci-dessus." } else { "Install Equalizer APO above first." }
                    return
                }
                $Dlg = New-Object System.Windows.Forms.OpenFileDialog
                $Dlg.Filter = "VST plugin (*.dll)|*.dll"
                if ($Dlg.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
                    Set-OptiAudioVST -VstPath $Dlg.FileName -Enabled $true
                    $Global:AudioVstStatusText.Text = $Dlg.FileName
                    $LogBox.AppendText(">> [OK] VST charge : $($Dlg.FileName)`n")
                    $LogBox.ScrollToEnd()
                }
            }.GetNewClosure())
            [void]$VstBtnRow.Children.Add($BtnBrowseVst)

            $BtnBypassVst = New-Object System.Windows.Controls.Button
            $BtnBypassVst.Content = if ($Global:CurrentLang -eq "FR") { "Desactiver" } else { "Disable" }
            $BtnBypassVst.Height = 28
            $BtnBypassVst.Width = 120
            $BtnBypassVst.Background = Get-Brush "#221616"
            $BtnBypassVst.Foreground = Get-Brush "#E74C3C"
            $BtnBypassVst.BorderThickness = "0"
            $BtnBypassVst.Add_Click({
                Set-OptiAudioVST -VstPath "" -Enabled $false
                $Global:AudioVstStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Aucun plugin charge." } else { "No plugin loaded." }
                $LogBox.AppendText(">> [OK] VST desactive`n")
                $LogBox.ScrollToEnd()
            }.GetNewClosure())
            [void]$VstBtnRow.Children.Add($BtnBypassVst)

            [void]$VstStack.Children.Add($VstBtnRow)
            $VstBox.Child = $VstStack
            [void]$Panel.Children.Add($VstBox)

            # --- Esports Sound Radar (sortie casque) ---
            $RadarBox = New-Object System.Windows.Controls.Border
            $RadarBox.Background = Get-Brush "#161622"
            $RadarBox.BorderBrush = Get-Brush "#2A2A3A"
            $RadarBox.BorderThickness = "1"
            $RadarBox.CornerRadius = "5"
            $RadarBox.Padding = "12"
            $RadarStack = New-Object System.Windows.Controls.StackPanel

            $RadarTitle = New-Object System.Windows.Controls.TextBlock
            $RadarTitle.Text = if ($Global:CurrentLang -eq "FR") { "Esports Sound Radar (sortie casque)" } else { "Esports Sound Radar (headset output)" }
            $RadarTitle.Foreground = Get-Brush "#00FFC8"
            $RadarTitle.FontSize = 12
            $RadarTitle.FontWeight = "Bold"
            $RadarTitle.Margin = "0,0,0,4"
            [void]$RadarStack.Children.Add($RadarTitle)

            $RadarDesc = New-Object System.Windows.Controls.TextBlock
            $RadarDesc.Text = if ($Global:CurrentLang -eq "FR") { "Attenue les basses (explosions) et booste 2500-4000Hz (bruits de pas)." } else { "Attenuates bass (explosions) and boosts 2500-4000Hz (footsteps)." }
            $RadarDesc.Foreground = Get-Brush "#A0A0A0"
            $RadarDesc.FontSize = 11
            $RadarDesc.TextWrapping = "Wrap"
            $RadarDesc.Margin = "0,0,0,8"
            [void]$RadarStack.Children.Add($RadarDesc)

            $Global:AudioRadarStatusText = New-Object System.Windows.Controls.TextBlock
            $Global:AudioRadarStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Statut : neutre" } else { "Status: neutral" }
            $Global:AudioRadarStatusText.Foreground = Get-Brush "#F5F5FA"
            $Global:AudioRadarStatusText.FontSize = 11
            $Global:AudioRadarStatusText.Margin = "0,0,0,8"
            [void]$RadarStack.Children.Add($Global:AudioRadarStatusText)

            $RadarBtnRow = New-Object System.Windows.Controls.StackPanel
            $RadarBtnRow.Orientation = "Horizontal"

            $BtnRadarOn = New-Object System.Windows.Controls.Button
            $BtnRadarOn.Content = if ($Global:CurrentLang -eq "FR") { "Activer" } else { "Enable" }
            $BtnRadarOn.Height = 28
            $BtnRadarOn.Width = 120
            $BtnRadarOn.Margin = "0,0,10,0"
            $BtnRadarOn.Background = Get-Brush "#2ECC71"
            $BtnRadarOn.Foreground = Get-Brush "#0A0A0E"
            $BtnRadarOn.FontWeight = "Bold"
            $BtnRadarOn.BorderThickness = "0"
            $BtnRadarOn.Add_Click({
                if (-not (Test-EqualizerApoInstalled)) {
                    $Global:AudioRadarStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Installe d'abord Equalizer APO ci-dessus." } else { "Install Equalizer APO above first." }
                    return
                }
                Set-OptiSoundRadar -Enabled $true
                $Global:AudioRadarStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Statut : actif" } else { "Status: active" }
                $LogBox.AppendText(">> [OK] Sound Radar active`n")
                $LogBox.ScrollToEnd()
            }.GetNewClosure())
            [void]$RadarBtnRow.Children.Add($BtnRadarOn)

            $BtnRadarOff = New-Object System.Windows.Controls.Button
            $BtnRadarOff.Content = if ($Global:CurrentLang -eq "FR") { "Mode neutre" } else { "Neutral mode" }
            $BtnRadarOff.Height = 28
            $BtnRadarOff.Width = 120
            $BtnRadarOff.Background = Get-Brush "#221616"
            $BtnRadarOff.Foreground = Get-Brush "#E74C3C"
            $BtnRadarOff.BorderThickness = "0"
            $BtnRadarOff.Add_Click({
                Set-OptiSoundRadar -Enabled $false
                $Global:AudioRadarStatusText.Text = if ($Global:CurrentLang -eq "FR") { "Statut : neutre" } else { "Status: neutral" }
                $LogBox.AppendText(">> [OK] Sound Radar desactive`n")
                $LogBox.ScrollToEnd()
            }.GetNewClosure())
            [void]$RadarBtnRow.Children.Add($BtnRadarOff)

            [void]$RadarStack.Children.Add($RadarBtnRow)
            $RadarBox.Child = $RadarStack
            [void]$Panel.Children.Add($RadarBox)
        }

        # CORRECTIF V15.1 : avertissement clair et permanent sur la limite reelle
        # de la resolution du timer (NtSetTimerResolution ne persiste pas apres
        # fermeture du programme).
        if ($Cat -eq "Timer") {
            $L = $Global:LangDict[$Global:CurrentLang]
            $WarnBox = New-Object System.Windows.Controls.Border
            $WarnBox.Background = Get-Brush "#221A0C"
            $WarnBox.BorderBrush = Get-Brush "#F1C40F"
            $WarnBox.BorderThickness = "1"
            $WarnBox.CornerRadius = "5"
            $WarnBox.Padding = "10"
            $WarnBox.Margin = "0,0,0,12"
            $WarnTxt = New-Object System.Windows.Controls.TextBlock
            $WarnTxt.Text = $L["TimerWarning"]
            $WarnTxt.Foreground = Get-Brush "#F1C40F"
            $WarnTxt.FontSize = 11
            $WarnTxt.TextWrapping = "Wrap"
            $WarnBox.Child = $WarnTxt
            [void]$Panel.Children.Add($WarnBox)

            $PersistBox = New-Object System.Windows.Controls.Border
            $PersistBox.Background = Get-Brush "#14162A"
            $PersistBox.BorderBrush = Get-Brush "#7C9CFF"
            $PersistBox.BorderThickness = "1"
            $PersistBox.CornerRadius = "5"
            $PersistBox.Padding = "12"
            $PersistBox.Margin = "0,0,0,15"
            $PersistStack = New-Object System.Windows.Controls.StackPanel

            $PersistTitle = New-Object System.Windows.Controls.TextBlock
            $isInstalled = Test-PersistentTimerResolutionInstalled
            if ($isInstalled) {
                $PersistTitle.Text = if ($Global:CurrentLang -eq "FR") { "✅ Timer Resolution persistant : ACTIF (tâche planifiée au démarrage)" } else { "✅ Persistent Timer Resolution: ACTIVE (scheduled task at logon)" }
            } else {
                $PersistTitle.Text = if ($Global:CurrentLang -eq "FR") { "Timer Resolution persistant : non installé" } else { "Persistent Timer Resolution: not installed" }
            }
            $PersistTitle.Foreground = Get-Brush "#00FFC8"
            $PersistTitle.FontSize = 12
            $PersistTitle.FontWeight = "Bold"
            $PersistTitle.Margin = "0,0,0,6"
            [void]$PersistStack.Children.Add($PersistTitle)

            $PersistDesc = New-Object System.Windows.Controls.TextBlock
            $PersistDesc.Text = if ($Global:CurrentLang -eq "FR") { "Installe un petit programme (compilé automatiquement) lancé à chaque connexion Windows pour garder la résolution active en permanence, sans avoir besoin d'ouvrir OPTI-DYLAN. Utilise la valeur cochée ci-dessous (0.50 ms par défaut si aucune case cochée)." } else { "Installs a small auto-compiled program launched at every Windows logon to keep the resolution active permanently, without needing OPTI-DYLAN open. Uses the checked value below (0.50 ms by default if none checked)." }
            $PersistDesc.Foreground = Get-Brush "#A0A0A0"
            $PersistDesc.FontSize = 11
            $PersistDesc.TextWrapping = "Wrap"
            $PersistDesc.Margin = "0,0,0,10"
            [void]$PersistStack.Children.Add($PersistDesc)

            $BtnRow = New-Object System.Windows.Controls.StackPanel
            $BtnRow.Orientation = "Horizontal"

            $BtnInstallPersist = New-Object System.Windows.Controls.Button
            $BtnInstallPersist.Content = if ($Global:CurrentLang -eq "FR") { "Installer (persistant)" } else { "Install (persistent)" }
            $BtnInstallPersist.Height = 28
            $BtnInstallPersist.Width = 160
            $BtnInstallPersist.Margin = "0,0,10,0"
            $BtnInstallPersist.Background = Get-Brush "#00FFC8"
            $BtnInstallPersist.Foreground = Get-Brush "#0A0A0E"
            $BtnInstallPersist.FontWeight = "Bold"
            $BtnInstallPersist.BorderThickness = "0"
            $BtnInstallPersist.Add_Click({
                $chosenId = 115..119 | Where-Object { $Global:CheckStates[$_] -eq $true } | Select-Object -First 1
                $msMap = @{115=0.45;116=0.50;117=0.60;118=0.75;119=1.00}
                $ms = if ($chosenId) { $msMap[$chosenId] } else { 0.50 }
                try {
                    Install-PersistentTimerResolution -Milliseconds $ms
                    $LogBox.AppendText(">> [OK] Timer Resolution persistant installé à $ms ms (tâche planifiée au démarrage de session)`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Installation Timer Resolution persistant -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Timer"
            })
            [void]$BtnRow.Children.Add($BtnInstallPersist)

            $BtnUninstallPersist = New-Object System.Windows.Controls.Button
            $BtnUninstallPersist.Content = if ($Global:CurrentLang -eq "FR") { "Désinstaller" } else { "Uninstall" }
            $BtnUninstallPersist.Height = 28
            $BtnUninstallPersist.Width = 120
            $BtnUninstallPersist.Background = Get-Brush "#221616"
            $BtnUninstallPersist.Foreground = Get-Brush "#E74C3C"
            $BtnUninstallPersist.BorderThickness = "0"
            $BtnUninstallPersist.Add_Click({
                try {
                    Uninstall-PersistentTimerResolution
                    $LogBox.AppendText(">> [OK] Timer Resolution persistant désinstallé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Désinstallation Timer Resolution persistant -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Timer"
            })
            [void]$BtnRow.Children.Add($BtnUninstallPersist)

            [void]$PersistStack.Children.Add($BtnRow)
            $PersistBox.Child = $PersistStack
            [void]$Panel.Children.Add($PersistBox)
        }

        if ($Cat -eq "Extreme") {
            $L = $Global:LangDict[$Global:CurrentLang]

            $WarnBox2 = New-Object System.Windows.Controls.Border
            $WarnBox2.Background = Get-Brush "#221A0C"
            $WarnBox2.BorderBrush = Get-Brush "#F1C40F"
            $WarnBox2.BorderThickness = "1"
            $WarnBox2.CornerRadius = "5"
            $WarnBox2.Padding = "10"
            $WarnBox2.Margin = "0,0,0,12"
            $WarnTxt2 = New-Object System.Windows.Controls.TextBlock
            $WarnTxt2.Text = $L["ExtremeWarning"]
            $WarnTxt2.Foreground = Get-Brush "#F1C40F"
            $WarnTxt2.FontSize = 11
            $WarnTxt2.TextWrapping = "Wrap"
            $WarnBox2.Child = $WarnTxt2
            [void]$Panel.Children.Add($WarnBox2)

            $PrioBox = New-Object System.Windows.Controls.Border
            $PrioBox.Background = Get-Brush "#14162A"
            $PrioBox.BorderBrush = Get-Brush "#7C9CFF"
            $PrioBox.BorderThickness = "1"
            $PrioBox.CornerRadius = "5"
            $PrioBox.Padding = "12"
            $PrioBox.Margin = "0,0,0,15"
            $PrioStack = New-Object System.Windows.Controls.StackPanel

            $PrioTitle = New-Object System.Windows.Controls.TextBlock
            $isPrioInstalled = Test-ProcessPriorityDaemonInstalled
            if ($isPrioInstalled) {
                $PrioTitle.Text = if ($Global:CurrentLang -eq "FR") { "✅ Démon de priorité de processus : ACTIF" } else { "✅ Process Priority Daemon: ACTIVE" }
            } else {
                $PrioTitle.Text = if ($Global:CurrentLang -eq "FR") { "Démon de priorité de processus : non installé" } else { "Process Priority Daemon: not installed" }
            }
            $PrioTitle.Foreground = Get-Brush "#7C9CFF"
            $PrioTitle.FontSize = 12
            $PrioTitle.FontWeight = "Bold"
            $PrioTitle.Margin = "0,0,0,6"
            [void]$PrioStack.Children.Add($PrioTitle)

            $PrioDesc = New-Object System.Windows.Controls.TextBlock
            $PrioDesc.Text = if ($Global:CurrentLang -eq "FR") { "Surveille en continu la fenêtre au premier plan (ton jeu) et lui donne automatiquement la priorité Haute, sans avoir à le faire manuellement dans le Gestionnaire des tâches à chaque lancement. Tourne en fond via une tâche planifiée au démarrage de session." } else { "Continuously watches the foreground window (your game) and automatically sets it to High priority, without manually doing it in Task Manager every launch. Runs in background via a scheduled task at logon." }
            $PrioDesc.Foreground = Get-Brush "#A0A0A0"
            $PrioDesc.FontSize = 11
            $PrioDesc.TextWrapping = "Wrap"
            $PrioDesc.Margin = "0,0,0,10"
            [void]$PrioStack.Children.Add($PrioDesc)

            $PrioBtnRow = New-Object System.Windows.Controls.StackPanel
            $PrioBtnRow.Orientation = "Horizontal"

            $BtnInstallPrio = New-Object System.Windows.Controls.Button
            $BtnInstallPrio.Content = if ($Global:CurrentLang -eq "FR") { "Installer le démon" } else { "Install daemon" }
            $BtnInstallPrio.Height = 28
            $BtnInstallPrio.Width = 160
            $BtnInstallPrio.Margin = "0,0,10,0"
            $BtnInstallPrio.Background = Get-Brush "#7C9CFF"
            $BtnInstallPrio.Foreground = Get-Brush "#0A0A0E"
            $BtnInstallPrio.FontWeight = "Bold"
            $BtnInstallPrio.BorderThickness = "0"
            $BtnInstallPrio.Add_Click({
                try {
                    Install-ProcessPriorityDaemon
                    $LogBox.AppendText(">> [OK] Démon de priorité de processus installé et lancé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Installation du démon de priorité -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Extreme"
            })
            [void]$PrioBtnRow.Children.Add($BtnInstallPrio)

            $BtnUninstallPrio = New-Object System.Windows.Controls.Button
            $BtnUninstallPrio.Content = if ($Global:CurrentLang -eq "FR") { "Désinstaller" } else { "Uninstall" }
            $BtnUninstallPrio.Height = 28
            $BtnUninstallPrio.Width = 120
            $BtnUninstallPrio.Background = Get-Brush "#221616"
            $BtnUninstallPrio.Foreground = Get-Brush "#E74C3C"
            $BtnUninstallPrio.BorderThickness = "0"
            $BtnUninstallPrio.Add_Click({
                try {
                    Uninstall-ProcessPriorityDaemon
                    $LogBox.AppendText(">> [OK] Démon de priorité de processus désinstallé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Désinstallation du démon -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Extreme"
            })
            [void]$PrioBtnRow.Children.Add($BtnUninstallPrio)

            [void]$PrioStack.Children.Add($PrioBtnRow)
            $PrioBox.Child = $PrioStack
            [void]$Panel.Children.Add($PrioBox)
        }

        if ($Cat -eq "Innovations") {
            $L = $Global:LangDict[$Global:CurrentLang]

            $InfoBox = New-Object System.Windows.Controls.Border
            $InfoBox.Background = Get-Brush "#14162A"
            $InfoBox.BorderBrush = Get-Brush "#7C9CFF"
            $InfoBox.BorderThickness = "1"
            $InfoBox.CornerRadius = "5"
            $InfoBox.Padding = "10"
            $InfoBox.Margin = "0,0,0,12"
            $InfoTxt = New-Object System.Windows.Controls.TextBlock
            $InfoTxt.Text = $L["InnovationsWarning"]
            $InfoTxt.Foreground = Get-Brush "#7C9CFF"
            $InfoTxt.FontSize = 11
            $InfoTxt.TextWrapping = "Wrap"
            $InfoBox.Child = $InfoTxt
            [void]$Panel.Children.Add($InfoBox)

            # --- Bloc Benchmark ---
            $BenchBox = New-Object System.Windows.Controls.Border
            $BenchBox.Background = Get-Brush "#0F1F1B"
            $BenchBox.BorderBrush = Get-Brush "#00FFC8"
            $BenchBox.BorderThickness = "1"
            $BenchBox.CornerRadius = "5"
            $BenchBox.Padding = "12"
            $BenchBox.Margin = "0,0,0,15"
            $BenchStack = New-Object System.Windows.Controls.StackPanel

            $BenchTitle = New-Object System.Windows.Controls.TextBlock
            $BenchTitle.Text = if ($Global:CurrentLang -eq "FR") { "📊 Benchmark rapide (CPU / Disque / RAM)" } else { "📊 Quick benchmark (CPU / Disk / RAM)" }
            $BenchTitle.Foreground = Get-Brush "#00FFC8"
            $BenchTitle.FontSize = 12
            $BenchTitle.FontWeight = "Bold"
            $BenchTitle.Margin = "0,0,0,6"
            [void]$BenchStack.Children.Add($BenchTitle)

            $BenchDesc = New-Object System.Windows.Controls.TextBlock
            $BenchDesc.Text = if ($Global:CurrentLang -eq "FR") { "Mesure la vitesse CPU, la vitesse disque (lecture/écriture) et l'état de la RAM en quelques secondes. Lance-le avant et après tes tweaks pour voir la différence réelle, en chiffres." } else { "Measures CPU speed, disk speed (read/write) and RAM state in a few seconds. Run it before and after your tweaks to see the real difference, in numbers." }
            $BenchDesc.Foreground = Get-Brush "#A0A0A0"
            $BenchDesc.FontSize = 11
            $BenchDesc.TextWrapping = "Wrap"
            $BenchDesc.Margin = "0,0,0,10"
            [void]$BenchStack.Children.Add($BenchDesc)

            $BtnBench = New-Object System.Windows.Controls.Button
            $BtnBench.Content = if ($Global:CurrentLang -eq "FR") { "Lancer le benchmark" } else { "Run benchmark" }
            $BtnBench.Height = 28
            $BtnBench.Width = 160
            $BtnBench.Background = Get-Brush "#00FFC8"
            $BtnBench.Foreground = Get-Brush "#0A0A0E"
            $BtnBench.FontWeight = "Bold"
            $BtnBench.BorderThickness = "0"
            $BtnBench.Add_Click({
                $LogBox.AppendText(">> [BENCHMARK] Test en cours (quelques secondes)...`n")
                $LogBox.ScrollToEnd()
                [System.Windows.Forms.Application]::DoEvents()
                try {
                    $r = Invoke-QuickBenchmark
                    $LogBox.AppendText(">> [BENCHMARK] CPU : $($r.cpu_ms) ms | Disque écriture : $($r.write_mbs) Mo/s | Disque lecture : $($r.read_mbs) Mo/s | RAM utilisée : $($r.ram_pct)% (libre : $($r.ram_free_gb) Go)`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Benchmark -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
            })
            [void]$BenchStack.Children.Add($BtnBench)

            $BenchBox.Child = $BenchStack
            [void]$Panel.Children.Add($BenchBox)

            # --- Bloc Smart Power Switcher ---
            $SpBox = New-Object System.Windows.Controls.Border
            $SpBox.Background = Get-Brush "#14162A"
            $SpBox.BorderBrush = Get-Brush "#7C9CFF"
            $SpBox.BorderThickness = "1"
            $SpBox.CornerRadius = "5"
            $SpBox.Padding = "12"
            $SpBox.Margin = "0,0,0,15"
            $SpStack = New-Object System.Windows.Controls.StackPanel

            $SpTitle = New-Object System.Windows.Controls.TextBlock
            $isSpInstalled = Test-SmartPowerDaemonInstalled
            if ($isSpInstalled) {
                $SpTitle.Text = if ($Global:CurrentLang -eq "FR") { "✅ Smart Power Switcher : ACTIF" } else { "✅ Smart Power Switcher: ACTIVE" }
            } else {
                $SpTitle.Text = if ($Global:CurrentLang -eq "FR") { "Smart Power Switcher : non installé" } else { "Smart Power Switcher: not installed" }
            }
            $SpTitle.Foreground = Get-Brush "#7C9CFF"
            $SpTitle.FontSize = 12
            $SpTitle.FontWeight = "Bold"
            $SpTitle.Margin = "0,0,0,6"
            [void]$SpStack.Children.Add($SpTitle)

            $SpDesc = New-Object System.Windows.Controls.TextBlock
            $SpDesc.Text = if ($Global:CurrentLang -eq "FR") { "Détecte automatiquement quand une fenêtre passe en plein écran (donc probablement un jeu) et bascule le plan d'alimentation sur Performances Élevées tout seul. Revient sur Équilibré dès que tu retournes sur le bureau. Zéro action de ta part." } else { "Automatically detects when a window goes fullscreen (likely a game) and switches your power plan to High Performance on its own. Reverts to Balanced as soon as you're back on the desktop. Zero effort on your part." }
            $SpDesc.Foreground = Get-Brush "#A0A0A0"
            $SpDesc.FontSize = 11
            $SpDesc.TextWrapping = "Wrap"
            $SpDesc.Margin = "0,0,0,10"
            [void]$SpStack.Children.Add($SpDesc)

            $SpBtnRow = New-Object System.Windows.Controls.StackPanel
            $SpBtnRow.Orientation = "Horizontal"

            $BtnInstallSp = New-Object System.Windows.Controls.Button
            $BtnInstallSp.Content = if ($Global:CurrentLang -eq "FR") { "Installer le démon" } else { "Install daemon" }
            $BtnInstallSp.Height = 28
            $BtnInstallSp.Width = 160
            $BtnInstallSp.Margin = "0,0,10,0"
            $BtnInstallSp.Background = Get-Brush "#7C9CFF"
            $BtnInstallSp.Foreground = Get-Brush "#0A0A0E"
            $BtnInstallSp.FontWeight = "Bold"
            $BtnInstallSp.BorderThickness = "0"
            $BtnInstallSp.Add_Click({
                try {
                    Install-SmartPowerDaemon
                    $LogBox.AppendText(">> [OK] Smart Power Switcher installé et lancé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Installation Smart Power Switcher -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Innovations"
            })
            [void]$SpBtnRow.Children.Add($BtnInstallSp)

            $BtnUninstallSp = New-Object System.Windows.Controls.Button
            $BtnUninstallSp.Content = if ($Global:CurrentLang -eq "FR") { "Désinstaller" } else { "Uninstall" }
            $BtnUninstallSp.Height = 28
            $BtnUninstallSp.Width = 120
            $BtnUninstallSp.Background = Get-Brush "#221616"
            $BtnUninstallSp.Foreground = Get-Brush "#E74C3C"
            $BtnUninstallSp.BorderThickness = "0"
            $BtnUninstallSp.Add_Click({
                try {
                    Uninstall-SmartPowerDaemon
                    $LogBox.AppendText(">> [OK] Smart Power Switcher désinstallé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Désinstallation Smart Power Switcher -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Innovations"
            })
            [void]$SpBtnRow.Children.Add($BtnUninstallSp)

            [void]$SpStack.Children.Add($SpBtnRow)
            $SpBox.Child = $SpStack
            [void]$Panel.Children.Add($SpBox)
        }

        $filter = $TxtSearch.Text.Trim()
        $Items = $Options | Where-Object { $_.Cat -eq $Cat }
        
        # Recherche active
        if (-not [string]::IsNullOrEmpty($filter)) {
            $Items = $Items | Where-Object {
                $_.LabelFR -match $filter -or $_.LabelEN -match $filter
            }
        }
        
        $CurrentGroup = ""
        
        foreach ($item in $Items) {
            # Tri des applications par sous-catégories
            if ($Cat -eq "Apps" -and $null -ne $item.SubCat) {
                $subCatParsed = @{}
                foreach ($pair in ($item.SubCat -split "\|")) {
                    $parts = $pair -split "="
                    $subCatParsed[$parts[0]] = $parts[1]
                }
                $groupName = $subCatParsed[$Global:CurrentLang]
                
                if ($groupName -ne $CurrentGroup) {
                    $CurrentGroup = $groupName
                    $Header = New-Object System.Windows.Controls.TextBlock
                    $Header.Text = "--- $CurrentGroup ---"
                    $Header.Foreground = Get-Brush "#00FFC8"
                    $Header.FontSize = 12
                    $Header.FontWeight = "Bold"
                    $Header.Margin = "0,15,0,5"
                    [void]$Panel.Children.Add($Header)
                }
            }

            $color = switch ($item.Risk) { "safe" {"#F5F5FA"} "moderate" {"#F1C40F"} "advanced" {"#E74C3C"} default {"#F5F5FA"} }
            $Brush = Get-Brush $color

            $Lbl = New-Object System.Windows.Controls.TextBlock
            if ($Global:CurrentLang -eq "FR") { $Lbl.Text = $item.LabelFR } else { $Lbl.Text = $item.LabelEN }
            $Lbl.Foreground = $Brush
            $Lbl.FontSize = if ($Global:Density -eq "Compact") { 12 } else { 13 }
            $Lbl.TextWrapping = "Wrap"
            $Lbl.VerticalAlignment = "Center"

            $Chk = New-Object System.Windows.Controls.CheckBox
            $Chk.Content = $Lbl
            $Chk.Margin = if ($Global:Density -eq "Compact") { "0,2,0,2" } else { "0,6,0,6" }
            $Chk.Tag = $item.Id
            $Chk.IsChecked = $Global:CheckStates[$item.Id]
            
            $Chk.Add_Checked({ 
                $id = $this.Tag
                $Global:CheckStates[$id] = $true 
                
                # Exclusivités Timer (IDs 115 à 121)
                if ($id -ge 115 -and $id -le 121) {
                    for ($i = 115; $i -le 121; $i++) {
                        if ($i -ne $id) { $Global:CheckStates[$i] = $false }
                    }
                    Render-Category $Global:LastCategory
                }
                
                # Exclusivités Processus (IDs 122 à 124)
                if ($id -ge 122 -and $id -le 124) {
                    for ($i = 122; $i -le 124; $i++) {
                        if ($i -ne $id) { $Global:CheckStates[$i] = $false }
                    }
                    Render-Category $Global:LastCategory
                }
                Update-SidebarCounters
            })
            $Chk.Add_Unchecked({ 
                $Global:CheckStates[$this.Tag] = $false 
                Update-SidebarCounters
            })
            [void]$Panel.Children.Add($Chk)
        }
        
        foreach ($key in $NavButtons.Keys) {
            if ($key -eq $Cat) {
                $NavButtons[$key].Background = Get-Brush "#181824"
                $NavButtons[$key].Foreground = Get-Brush "#00FFC8"
            } else {
                $NavButtons[$key].Background = Get-Brush "#101016"
                $NavButtons[$key].Foreground = Get-Brush "#A0A0B4"
            }
        }
    } catch {
        Write-Log "[ERR] $($_.Exception.Message)" $false
    }
}

$TxtSearch.Add_TextChanged({
    Render-Category $Global:LastCategory
})

# --- BOUTONS DE SÉLECTION RAPIDE ---
$BtnSelectSafe.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps" -or $item.Cat -eq "Bloatwares") { continue }
        if ($item.Risk -eq "safe" -and ($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[119] = $true

    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[122] = $true
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckSafe"
})

$BtnSelectMod.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps" -or $item.Cat -eq "Bloatwares") { continue }
        if (($item.Risk -eq "safe" -or $item.Risk -eq "moderate") -and ($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[116] = $true

    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[123] = $true
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckMod"
})

$BtnSelectAdv.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps" -or $item.Cat -eq "Bloatwares") { continue }
        if (($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        }
    }
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[115] = $true

    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[124] = $true
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckAdv"
})

$BtnClearAll.Add_Click({
    $Keys = @($Global:CheckStates.Keys)
    foreach ($id in $Keys) {
        $Global:CheckStates[$id] = $false
    }
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogClearAll"
})

foreach ($key in $NavButtons.Keys) {
    $b = $NavButtons[$key]
    if ($null -ne $b) { $b.Add_Click({ Render-Category $this.Tag }) }
}

$ComboLang.Add_SelectionChanged({
    if ($ComboLang.SelectedIndex -eq 0) { $Global:CurrentLang = "FR" } else { $Global:CurrentLang = "EN" }
    Update-InterfaceLanguage
})

$ComboDensity.Add_SelectionChanged({
    if ($ComboDensity.SelectedIndex -eq 0) { $Global:Density = "Detailed" } else { $Global:Density = "Compact" }
    Render-Category $Global:LastCategory
})

$BtnRestore.Add_Click({
    Write-Log "LogRestoreStart"
    try {
        Checkpoint-Computer -Description "Avant OPTI-DYLAN" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
        Write-Log "LogRestoreOk"
    } catch {
        Write-Log "[WARN] $($_.Exception.Message)" $false
    }
})

$BtnShortcut.Add_Click({
    try {
        Install-DesktopShortcut
        $LogBox.AppendText(">> [OK] Raccourci Bureau créé — double-clique dessus la prochaine fois, plus besoin de PowerShell.`n")
    } catch {
        $LogBox.AppendText(">> [ECHEC] Création du raccourci -> $($_.Exception.Message)`n")
    }
    $LogBox.ScrollToEnd()
    Update-ShortcutButtonLabel
})

function Invoke-ApplyAllChecked {
    $L = $Global:LangDict[$Global:CurrentLang]
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }

    if ($selected.Count -eq 0 -and $Global:SelectedSvcHostValue -eq "380000") {
        [System.Windows.MessageBox]::Show($L["NoOption"], "OPTI-DYLAN")
        return
    }

    $BtnApply.IsEnabled = $false
    $LogBox.AppendText(">> " + ($L["Exec"] -f $selected.Count) + "`n")

    # 1. APPLICATION DU TWEAK RAM SVCHOST INDÉPENDANT (rapide, reste synchrone)
    try {
        Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" $Global:SelectedSvcHostValue
        $LogBox.AppendText(">> [OK] SvcHostSplitThresholdInKB paramétré à $Global:SelectedSvcHostValue Ko`n")
    } catch {
        $LogBox.AppendText(">> [ECHEC] Configuration SvcHostSplitThresholdInKB`n")
    }
    $LogBox.ScrollToEnd()

    # 2. FILE D'ATTENTE ASYNCHRONE POUR LES TWEAKS SÉLECTIONNÉS
    # Chaque tweak tourne dans le runspace de fond via BeginInvoke ; le timer
    # ApplyTimer verifie l'avancement toutes les 150ms sans jamais bloquer
    # le thread de l'interface, meme si un tweak (DISM, winget...) est long.
    $Global:ApplyQueue.Clear()
    foreach ($item in $selected) { $Global:ApplyQueue.Enqueue($item) }
    $Global:ApplyTotal = $selected.Count
    $Global:ApplyDone = 0
    $ProgressBarApply.Maximum = [Math]::Max(1, $selected.Count)
    $ProgressBarApply.Value = 0
    $TxtProgressLabel.Text = "0 / $($selected.Count)"
    $ApplyTimer.Start()
}

$BtnApply.Add_Click({ Invoke-ApplyAllChecked })

# ============================================================
# EXPORT AUTOMATIQUE DU LOG A LA FERMETURE
# ============================================================
$Form.Add_Closing({
    try {
        if ($null -ne $Global:CurrentPS) { $Global:CurrentPS.Dispose() }
        if ($null -ne $Global:BgRunspace) { $Global:BgRunspace.Close() }
        if ($null -ne $Global:AudioVuTimer) { $Global:AudioVuTimer.Stop() }
    } catch {}
    try {
        $L = $Global:LangDict[$Global:CurrentLang]
        $lines = foreach ($k in $Global:LogHistory) { if ($L.ContainsKey($k)) { $L[$k] } else { $k } }
        $reportName = "opti_dylan_report_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".txt"
        $reportPath = Join-Path ([Environment]::GetFolderPath("Desktop")) $reportName
        [System.IO.File]::WriteAllLines($reportPath, [string[]]$lines)
    } catch {
        # Echec silencieux : on ne bloque jamais la fermeture du programme pour ca.
    }
})

# Lancement initial
$Global:LogHistory.Add("LogEngineOnline")
if ($Global:AutoCheckCount -gt 0) { $Global:LogHistory.Add("LogAutoCheck|$($Global:AutoCheckCount)") }
Update-SidebarCounters
Update-InterfaceLanguage
[void]$Form.ShowDialog()
