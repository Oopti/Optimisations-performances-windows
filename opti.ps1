#requires -Version 5.1
# OPTI-DYLAN TOOLKIT PRO V15.2

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

# FIX raccourci bureau : $PSCommandPath est vide selon la methode de lancement
# (double-clic vs "Executer avec PowerShell" vs collage dans une console, etc.).
# On capture ICI, au niveau script (pas dans une fonction), toutes les
# alternatives possibles UNE SEULE FOIS, pendant qu'elles sont encore fiables.
$Global:AppSourcePath = if ($PSCommandPath) { $PSCommandPath }
    elseif ($MyInvocation.MyCommand.Path) { $MyInvocation.MyCommand.Path }
    else { $null }
# Plusieurs methodes de capture en cascade, chacune protegee par try/catch.
$Global:AppSourceText = $null
foreach ($method in @(
    { $MyInvocation.MyCommand.ScriptBlock.Ast.Extent.Text },
    { $MyInvocation.MyCommand.ScriptBlock.ToString() },
    { if ($Global:AppSourcePath) { Get-Content -Raw -Path $Global:AppSourcePath -ErrorAction Stop } }
)) {
    if ($Global:AppSourceText) { break }
    try {
        $result = & $method
        if ($result) { $Global:AppSourceText = $result }
    } catch { }
}

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
        "CatReparateur" = "Réparateur"
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
        "CatReparateur" = "Repair"
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

function Global:Test-EqualizerApoInstalled { return (Test-Path $Global:EqApoPath) }

# IMPORTANT : pas d'installation "silencieuse" ici. D'apres les tickets
# officiels du projet (sourceforge.net/p/equalizerapo/tickets/186), le setup
# NSIS lance son Configurator.exe en ExecWait, qui exige de choisir le
# peripherique audio a la main -- un vrai silent install n'existe pas pour
# ce logiciel precis, et pretendre le contraire aurait ete du theatre de
# plus. On telecharge et on lance l'installeur normalement, une seule fois.
function Global:Install-EqualizerApoGuided {
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

function Global:Set-OptiAudioVST {
    param([string]$VstPath, [bool]$Enabled)
    if ($Enabled -and (Test-Path $VstPath)) {
        return Set-EqualizerApoSection -SectionName "VST" -Lines @("Device: Microphone", "VSTPlugin: `"$VstPath`"")
    } else {
        return Set-EqualizerApoSection -SectionName "VST" -Lines @()
    }
}

function Global:Set-OptiSoundRadar {
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
function Global:Set-ProcessReductionLevel([int]$Level) {
    try {
    # On ne coche plus 122/123/124 : leurs propres Actions ecrivent la meme cle
    # de registre que le ComboBox "Optimiseur RAM" ci-dessous, et les deux
    # mecanismes qui tournaient en meme temps se marchaient dessus (source
    # probable de l'echec "operation non autorisee" vu en test). Le ComboBox
    # est le seul a piloter le seuil SvcHost desormais.
    $managedIds = @(20,27,24,16,17,61,68,69,74,63,137,62,66,67,146,64,65,158,159,160,161,162,163,164,165,89,81,150)
    foreach ($id in $managedIds) { $Global:CheckStates[$id] = $false }

    $svcHostValue = "380000"
    if ($Level -ge 2) { $Global:CheckStates[20]=$true; $Global:CheckStates[27]=$true; $Global:CheckStates[24]=$true }
    if ($Level -ge 3) { $Global:CheckStates[16]=$true; $svcHostValue = "8388608" }
    if ($Level -ge 4) {
        $Global:CheckStates[17]=$true; $Global:CheckStates[61]=$true
        $Global:CheckStates[68]=$true; $Global:CheckStates[69]=$true; $Global:CheckStates[74]=$true
        $Global:CheckStates[158]=$true; $Global:CheckStates[159]=$true
        $Global:CheckStates[161]=$true; $Global:CheckStates[162]=$true; $Global:CheckStates[163]=$true
        $svcHostValue = "16777216"
    }
    if ($Level -ge 5) {
        $Global:CheckStates[63]=$true; $Global:CheckStates[137]=$true
        $Global:CheckStates[62]=$true; $Global:CheckStates[66]=$true; $Global:CheckStates[67]=$true; $Global:CheckStates[146]=$true
        $Global:CheckStates[64]=$true; $Global:CheckStates[65]=$true
        $Global:CheckStates[160]=$true; $Global:CheckStates[164]=$true; $Global:CheckStates[165]=$true
        $Global:CheckStates[89]=$true; $Global:CheckStates[81]=$true; $Global:CheckStates[150]=$true
        $svcHostValue = "67108864"
    }

    $Global:SelectedSvcHostValue = $svcHostValue
    if ($null -eq $ComboSvcHostRam) {
        throw "ComboSvcHostRam est `$null (le controle XAML n'a pas ete trouve par FindName)."
    }
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
    Invoke-ApplyAllChecked -OnlyIds $managedIds
    } catch {
        $realMsg = if ($_.Exception.InnerException) { $_.Exception.InnerException.Message } else { $_.Exception.Message }
        $LogBox.AppendText(">> [ECHEC NIVEAU $Level] $realMsg`n")
        $LogBox.ScrollToEnd()
        [System.Windows.MessageBox]::Show("Erreur reducteur de processus : $realMsg", "OPTI-DYLAN - Debug")
    }
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
    $principal = New-ScheduledTaskPrincipal -UserId "$env:COMPUTERNAME\$env:USERNAME" -RunLevel Highest -LogonType Interactive
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
    $principal = New-ScheduledTaskPrincipal -UserId "$env:COMPUTERNAME\$env:USERNAME" -RunLevel Highest -LogonType Interactive
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

# ============================================================
# NETTOYEUR RAM (4e demon persistant) - vide le working set de tous les
# process (EmptyWorkingSet, psapi.dll) + purge la Standby List noyau
# (NtSetSystemInformation, technique RAMMap) a intervalle reglable.
# L'intervalle se change a chaud via un registre lu a chaque cycle,
# pas besoin de reinstaller le demon pour l'ajuster.
# ============================================================
$Global:RamCleanerTaskName = "OPTI-DYLAN-RamCleaner"
$Global:RamCleanerInstallDir = Join-Path $env:LOCALAPPDATA "OPTI-DYLAN"
$Global:RamCleanerExePath = Join-Path $Global:RamCleanerInstallDir "RamCleanerDaemon.exe"
$Global:RamCleanerRegPath = "HKCU:\Software\OPTI-DYLAN"
$Global:RamCleanerRegName = "RamCleanerIntervalSeconds"

function Set-RamCleanerInterval([int]$Seconds) {
    if (-not (Test-Path $Global:RamCleanerRegPath)) {
        New-Item -Path $Global:RamCleanerRegPath -Force | Out-Null
    }
    New-ItemProperty -Path $Global:RamCleanerRegPath -Name $Global:RamCleanerRegName -PropertyType DWord -Value $Seconds -Force | Out-Null
}

function Install-RamCleanerDaemon {
    if (-not (Test-Path $Global:RamCleanerInstallDir)) {
        New-Item -Path $Global:RamCleanerInstallDir -ItemType Directory -Force | Out-Null
    }

    $csharpSource = @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;
using Microsoft.Win32;

public class Program {
    [DllImport("psapi.dll")]
    static extern bool EmptyWorkingSet(IntPtr hProcess);

    [DllImport("ntdll.dll")]
    static extern int NtSetSystemInformation(int SystemInformationClass, IntPtr SystemInformation, int SystemInformationLength);

    static void PurgeStandbyList() {
        try {
            IntPtr ptr = Marshal.AllocHGlobal(4);
            Marshal.WriteInt32(ptr, 4); // MemoryPurgeStandbyList
            NtSetSystemInformation(80, ptr, 4); // SystemMemoryListInformation
            Marshal.FreeHGlobal(ptr);
        } catch { }
    }

    static void TrimAllProcesses() {
        foreach (var p in Process.GetProcesses()) {
            try { EmptyWorkingSet(p.Handle); } catch { }
        }
    }

    public static void Main(string[] args) {
        while (true) {
            int intervalSec = 300;
            try {
                object v = Registry.GetValue("HKEY_CURRENT_USER\\Software\\OPTI-DYLAN", "RamCleanerIntervalSeconds", 300);
                if (v != null) intervalSec = Convert.ToInt32(v);
            } catch { }

            if (intervalSec <= 0) {
                Thread.Sleep(5000); // desactive (0) : on repolle juste, pas de purge
                continue;
            }
            TrimAllProcesses();
            PurgeStandbyList();
            Thread.Sleep(intervalSec * 1000);
        }
    }
}
'@

    if (Test-Path $Global:RamCleanerExePath) {
        Get-Process -Name "RamCleanerDaemon" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 300
        Remove-Item $Global:RamCleanerExePath -Force -ErrorAction SilentlyContinue
    }

    Add-Type -TypeDefinition $csharpSource -OutputType WindowsApplication -OutputAssembly $Global:RamCleanerExePath -ReferencedAssemblies "Microsoft.Win32.Registry" -ErrorAction Stop

    if (-not (Test-Path $Global:RamCleanerRegPath) -or $null -eq (Get-ItemProperty -Path $Global:RamCleanerRegPath -Name $Global:RamCleanerRegName -ErrorAction SilentlyContinue)) {
        Set-RamCleanerInterval -Seconds 300
    }

    Unregister-ScheduledTask -TaskName $Global:RamCleanerTaskName -Confirm:$false -ErrorAction SilentlyContinue

    $action = New-ScheduledTaskAction -Execute $Global:RamCleanerExePath
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $principal = New-ScheduledTaskPrincipal -UserId "$env:COMPUTERNAME\$env:USERNAME" -RunLevel Highest -LogonType Interactive
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero) -Hidden

    Register-ScheduledTask -TaskName $Global:RamCleanerTaskName -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null
    Start-ScheduledTask -TaskName $Global:RamCleanerTaskName
}

function Uninstall-RamCleanerDaemon {
    Unregister-ScheduledTask -TaskName $Global:RamCleanerTaskName -Confirm:$false -ErrorAction SilentlyContinue
    Get-Process -Name "RamCleanerDaemon" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 300
    Remove-Item $Global:RamCleanerExePath -Force -ErrorAction SilentlyContinue
}

function Test-RamCleanerDaemonInstalled {
    $task = Get-ScheduledTask -TaskName $Global:RamCleanerTaskName -ErrorAction SilentlyContinue
    return ($null -ne $task)
}

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
    $principal = New-ScheduledTaskPrincipal -UserId "$env:COMPUTERNAME\$env:USERNAME" -RunLevel Highest -LogonType Interactive
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

    if ($Global:AppSourcePath -and (Test-Path $Global:AppSourcePath)) {
        Copy-Item -Path $Global:AppSourcePath -Destination $Global:AppScriptPath -Force
    } elseif ($Global:AppSourceText) {
        # Aucun chemin de fichier fiable trouve (lancement colle/pipe/etc.) :
        # on ecrit le script tel qu'il tourne actuellement en memoire.
        Set-Content -Path $Global:AppScriptPath -Value $Global:AppSourceText -Encoding UTF8 -Force
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
    $Principal = New-ScheduledTaskPrincipal -UserId "$env:COMPUTERNAME\$env:USERNAME" -RunLevel Highest -LogonType Interactive
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
        Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$exe" "Debugger" "$env:windir\System32\taskkill.exe" "String"
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
$Options += [PSCustomObject]@{Id=204; Cat="Bloatwares"; LabelFR="Désinstaller réellement les Widgets (paquet complet, pas juste masqué)"; LabelEN="Actually uninstall Widgets (full package, not just hidden)"; Risk="moderate"; Action={
    Get-Process *Widget* -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
    Get-AppxPackage Microsoft.WidgetsPlatformRuntime -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    Get-AppxPackage MicrosoftWindows.Client.WebExperience -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
}}
$Options += [PSCustomObject]@{Id=205; Cat="Bloatwares"; LabelFR="Bloquer les suggestions d'apps dans la recherche du menu Démarrer (Store)"; LabelEN="Block Store app recommendations in Start menu search"; Risk="moderate"; Action={
    icacls "$Env:LocalAppData\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\LocalState\store.db" /deny Everyone:F 2>$null
}}
$Options += [PSCustomObject]@{Id=206; Cat="Confidentialite"; LabelFR="Refuser la géolocalisation au niveau consentement matériel + capteurs + cartes"; LabelEN="Deny location at the hardware consent level + sensors + maps"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" 0
    Set-Reg "HKLM:\SYSTEM\Maps" "AutoUpdateEnabled" 0
}}
$Options += [PSCustomObject]@{Id=207; Cat="Confidentialite"; LabelFR="Bloquer l'exécution du WPBT (table binaire OEM au démarrage -- vecteur d'attaque connu, désactivation = plus sûr)"; LabelEN="Block WPBT execution (OEM boot-time binary table -- known attack vector, disabling is safer)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" "DisableWpbtExecution" 1
}}
$Options += [PSCustomObject]@{Id=208; Cat="Confidentialite"; LabelFR="Télémétrie complémentaire (pub par app, saisie/encre, échantillons Defender jamais envoyés, wermgr)"; LabelEN="Complementary telemetry (per-app ads, ink/typing, Defender samples never sent, wermgr)"; Risk="safe"; Action={
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
$Options += [PSCustomObject]@{Id=209; Cat="Bloatwares"; LabelFR="Débloatage Microsoft Edge (télémétrie, pubs, extension pub bloquée, suggestions)"; LabelEN="Microsoft Edge debloat (telemetry, ads, blocked ad extension, suggestions)"; Risk="moderate"; Action={
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
$Options += [PSCustomObject]@{Id=210; Cat="Confidentialite"; LabelFR="Désactiver les fonctionnalités consommateur Windows (installation auto de jeux/apps tierces)"; LabelEN="Disable Windows consumer features (auto-install of games/third-party apps)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" 1
}}
$Options += [PSCustomObject]@{Id=211; Cat="Gaming"; LabelFR="Xbox/Gaming complémentaire (Game Bar capture + paquets Xbox restants)"; LabelEN="Complementary Xbox/Gaming (Game Bar capture + remaining Xbox packages)"; Risk="moderate"; Action={
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" 0
    foreach ($pkg in @("Microsoft.XboxIdentityProvider","Microsoft.XboxSpeechToTextOverlay","Microsoft.GamingApp","Microsoft.Xbox.TCUI","Microsoft.XboxGamingOverlay")) {
        Uninstall-Appx $pkg
    }
}}
$Options += [PSCustomObject]@{Id=212; Cat="Bloatwares"; LabelFR="Apps pré-installées complémentaires (Bing, Todos, Sound Recorder, Sticky Notes, DevHome, Outlook nouveau, Alarms, GetHelp, Zune, Teams)"; LabelEN="Complementary pre-installed apps (Bing, Todos, Sound Recorder, Sticky Notes, DevHome, new Outlook, Alarms, GetHelp, Zune, Teams)"; Risk="safe"; Action={
    foreach ($pkg in @("Microsoft.WindowsFeedbackHub","Microsoft.BingNews","Microsoft.BingSearch","Microsoft.BingWeather","Clipchamp.Clipchamp","Microsoft.Todos","Microsoft.PowerAutomateDesktop","Microsoft.WindowsSoundRecorder","Microsoft.MicrosoftStickyNotes","Microsoft.Windows.DevHome","Microsoft.OutlookForWindows","Microsoft.WindowsAlarms","Microsoft.StartExperiencesApp","Microsoft.GetHelp","Microsoft.ZuneMusic","MicrosoftCorporationII.QuickAssist","MSTeams")) {
        Uninstall-Appx $pkg
    }
    $TeamsPath = "$Env:LocalAppData\Microsoft\Teams\Update.exe"
    if (Test-Path $TeamsPath) {
        Start-Process $TeamsPath -ArgumentList "-uninstall" -Wait -ErrorAction SilentlyContinue
        Remove-Item $TeamsPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}}
$Options += [PSCustomObject]@{Id=213; Cat="Confidentialite"; LabelFR="IA Windows complémentaire (paquet CoreAI, service WSAIFabricSvc)"; LabelEN="Complementary Windows AI (CoreAI package, WSAIFabricSvc service)"; Risk="advanced"; Action={
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
$Options += [PSCustomObject]@{Id=214; Cat="Nettoyage"; LabelFR="Divers confort (fin de tâche clic droit taskbar, correctif dual-boot UTC, masquer Accueil/Galerie Explorer)"; LabelEN="Misc QoL (end task on taskbar right-click, dual-boot UTC fix, hide Explorer Home/Gallery)"; Risk="moderate"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" "TaskbarEndTask" 1
    Set-Reg "HKCU:\Software\Classes\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" "System.IsPinnedToNameSpaceTree" 0
    Set-Reg "HKCU:\Software\Classes\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" "System.IsPinnedToNameSpaceTree" 0
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "LaunchTo" 1
}}






















































$Options += [PSCustomObject]@{Id=242; Cat="Processus"; LabelFR="Win32PrioritySeparation → PriorityControl"; LabelEN="Win32PrioritySeparation → PriorityControl"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\ControlSet001\Control\PriorityControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\ControlSet001\Control\PriorityControl' -Name 'Win32PrioritySeparation' -PropertyType DWord -Value '0x00000014' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=243; Cat="Processus"; LabelFR="Win32PrioritySeparation, FeatureSettings → PriorityControl"; LabelEN="Win32PrioritySeparation, FeatureSettings → PriorityControl"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl' -Name 'Win32PrioritySeparation' -PropertyType DWord -Value '40' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'FeatureSettings' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=244; Cat="Nettoyage"; LabelFR="EnablePrefetcher → PrefetchParameters"; LabelEN="EnablePrefetcher → PrefetchParameters"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters' -Name 'EnablePrefetcher' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=245; Cat="Services"; LabelFR="MouseDataQueueSize → Parameters"; LabelEN="MouseDataQueueSize → Parameters"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\mouclass\Parameters' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\mouclass\Parameters' -Name 'MouseDataQueueSize' -PropertyType DWord -Value '30' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=246; Cat="Services"; LabelFR="KeyboardDataQueueSize → Parameters"; LabelEN="KeyboardDataQueueSize → Parameters"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters' -Name 'KeyboardDataQueueSize' -PropertyType DWord -Value '30' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=247; Cat="Services"; LabelFR="Start → WSearch"; LabelEN="Start → WSearch"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\WSearch' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\WSearch' -Name 'Start' -PropertyType DWord -Value '4' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=248; Cat="Services"; LabelFR="Start → SysMain"; LabelEN="Start → SysMain"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\SysMain' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\SysMain' -Name 'Start' -PropertyType DWord -Value '4' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=249; Cat="Gaming"; LabelFR="RmGpsPsEnablePerCpuCoreDpc → GraphicsDrivers"; LabelEN="RmGpsPsEnablePerCpuCoreDpc → GraphicsDrivers"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name 'RmGpsPsEnablePerCpuCoreDpc' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power' -Name 'RmGpsPsEnablePerCpuCoreDpc' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm' -Name 'RmGpsPsEnablePerCpuCoreDpc' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI' -Name 'RmGpsPsEnablePerCpuCoreDpc' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak' -Name 'RmGpsPsEnablePerCpuCoreDpc' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=250; Cat="Gaming"; LabelFR="GameFullScreenOptimizations → GameConfigStore"; LabelEN="GameFullScreenOptimizations → GameConfigStore"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameFullScreenOptimizations' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=251; Cat="Gaming"; LabelFR="GameDVR_Enabled → GameConfigStore"; LabelEN="GameDVR_Enabled → GameConfigStore"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=252; Cat="Gaming"; LabelFR="Enabled, EnableActivityFeed, SilentInstalledAppsEnabled, SystemPaneSuggestionsEnabled, ShowSyncProviderNotifications, SoftLandingEnabled, RotatingLockScreenEnabled, EnableLUA, DisableAutomaticRestartSignOn, DisableWindowsConsumerFeatures, .tif, .tiff, .bmp, .dib, .gif, .jfif, .jpe, .jpeg, .jpg, .jxr, .png, RotatingLockScreenOverlayEnabled, SubscribedContent-310093Enabled, AppCaptureEnabled, GameDVR_Enabled, Start → AdvertisingInfo"; LabelEN="Enabled, EnableActivityFeed, SilentInstalledAppsEnabled, SystemPaneSuggestionsEnabled, ShowSyncProviderNotifications, SoftLandingEnabled, RotatingLockScreenEnabled, EnableLUA, DisableAutomaticRestartSignOn, DisableWindowsConsumerFeatures, .tif, .tiff, .bmp, .dib, .gif, .jfif, .jpe, .jpeg, .jpg, .jxr, .png, RotatingLockScreenOverlayEnabled, SubscribedContent-310093Enabled, AppCaptureEnabled, GameDVR_Enabled, Start → AdvertisingInfo"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableActivityFeed' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SoftLandingEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'DisableAutomaticRestartSignOn' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.tif' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.tiff' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.bmp' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.dib' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.gif' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.jfif' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.jpe' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.jpeg' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.jpg' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.jxr' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations' -Name '.png' -PropertyType String -Value 'PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableActivityFeed' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SoftLandingEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-310093Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\kdnic' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\kdnic' -Name 'Start' -PropertyType DWord -Value '4' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\NdisVirtualBus' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\NdisVirtualBus' -Name 'Start' -PropertyType DWord -Value '4' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\Vid' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\Vid' -Name 'Start' -PropertyType DWord -Value '4' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=253; Cat="Gaming"; LabelFR="value → AllowGameDVR"; LabelEN="value → AllowGameDVR"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Name 'value' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=254; Cat="Gaming"; LabelFR="GameDVR_FSEBehaviorMode, GameDVR_HonorUserFSEBehaviorMode, GameDVR_FSEBehavior, GameDVR_DXGIHonorFSEWindowsCompatible → GameConfigStore"; LabelEN="GameDVR_FSEBehaviorMode, GameDVR_HonorUserFSEBehaviorMode, GameDVR_FSEBehavior, GameDVR_DXGIHonorFSEWindowsCompatible → GameConfigStore"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_FSEBehaviorMode' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_HonorUserFSEBehaviorMode' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_FSEBehavior' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_DXGIHonorFSEWindowsCompatible' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=255; Cat="Gaming"; LabelFR="GameDVR_Enabled → GameConfigStore"; LabelEN="GameDVR_Enabled → GameConfigStore"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=256; Cat="Power"; LabelFR="Delaydestroyer 33"; LabelEN="Delaydestroyer 33"; Risk="safe"; Action={
    powercfg -import "C:\Delay Destroyer Tools\Power Plan\Ultimate Performance.pow"
}}

$Options += [PSCustomObject]@{Id=257; Cat="Power"; LabelFR="Delaydestroyer 34"; LabelEN="Delaydestroyer 34"; Risk="safe"; Action={
    powercfg -import "C:\Delay Destroyer Tools\Power Plan\Ultimate Performance Idle Off.pow"
}}

$Options += [PSCustomObject]@{Id=258; Cat="Power"; LabelFR="Delaydestroyer 35"; LabelEN="Delaydestroyer 35"; Risk="safe"; Action={
    powercfg /setactive %plan_guid% >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=259; Cat="Power"; LabelFR="Delaydestroyer 36"; LabelEN="Delaydestroyer 36"; Risk="safe"; Action={
    powercfg /setactive %idle_off_guid% >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=260; Cat="Power"; LabelFR="Delaydestroyer 37"; LabelEN="Delaydestroyer 37"; Risk="safe"; Action={
    powercfg.cpl
}}

$Options += [PSCustomObject]@{Id=261; Cat="Power"; LabelFR="Delaydestroyer 38"; LabelEN="Delaydestroyer 38"; Risk="safe"; Action={
    powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=262; Cat="Power"; LabelFR="Delaydestroyer 39"; LabelEN="Delaydestroyer 39"; Risk="safe"; Action={
    powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=263; Cat="Power"; LabelFR="Delaydestroyer 40"; LabelEN="Delaydestroyer 40"; Risk="safe"; Action={
    powercfg -delete e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=264; Cat="Power"; LabelFR="PerformanceBoostMode → PowerSettings"; LabelEN="PerformanceBoostMode → PowerSettings"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings' -Name 'PerformanceBoostMode' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=265; Cat="Power"; LabelFR="Attributes → 943c8cb6-6f93-4227-ad87-e9a3feec08d1"; LabelEN="Attributes → 943c8cb6-6f93-4227-ad87-e9a3feec08d1"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1' -Name 'Attributes' -PropertyType String -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=266; Cat="Power"; LabelFR="Attributes, ACSettingIndex, DCSettingIndex, SearchOrderConfig, HiberbootEnabled, PowerThrottlingOff, HibernateEnabledDefault → 943c8cb6-6f93-4227-ad87-e9a3feec08d1"; LabelEN="Attributes, ACSettingIndex, DCSettingIndex, SearchOrderConfig, HiberbootEnabled, PowerThrottlingOff, HibernateEnabledDefault → 943c8cb6-6f93-4227-ad87-e9a3feec08d1"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1' -Name 'Attributes' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'DCSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'DCSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching' -Name 'SearchOrderConfig' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Name 'PowerThrottlingOff' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'HibernateEnabledDefault' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=267; Cat="Power"; LabelFR="ACSettingIndex, DCSettingIndex, PowerThrottlingOff → 381b4222-f694-41f0-9685-ff5bb260df2e"; LabelEN="ACSettingIndex, DCSettingIndex, PowerThrottlingOff → 381b4222-f694-41f0-9685-ff5bb260df2e"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'DCSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'DCSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Name 'ACSettingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Name 'PowerThrottlingOff' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=268; Cat="Timer"; LabelFR="GlobalTimerResolutionRequests → kernel"; LabelEN="GlobalTimerResolutionRequests → kernel"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel' -Name 'GlobalTimerResolutionRequests' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=269; Cat="Timer"; LabelFR="SystemResponsiveness → SystemProfile"; LabelEN="SystemResponsiveness → SystemProfile"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=270; Cat="Timer"; LabelFR="NetworkThrottlingIndex, SystemResponsiveness, MenuShowDelay, WaitToKillAppTimeout, HungAppTimeout, AutoEndTasks, LowLevelHooksTimeout, WaitToKillServiceTimeout → SystemProfile"; LabelEN="NetworkThrottlingIndex, SystemResponsiveness, MenuShowDelay, WaitToKillAppTimeout, HungAppTimeout, AutoEndTasks, LowLevelHooksTimeout, WaitToKillServiceTimeout → SystemProfile"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -PropertyType DWord -Value '4294967295' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'WaitToKillAppTimeout' -PropertyType String -Value '5000' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'HungAppTimeout' -PropertyType String -Value '4000' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'AutoEndTasks' -PropertyType String -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'LowLevelHooksTimeout' -PropertyType DWord -Value '4096' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'WaitToKillServiceTimeout' -PropertyType DWord -Value '8192' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control' -Name 'WaitToKillServiceTimeout' -PropertyType String -Value '2000' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=271; Cat="Confidentialite"; LabelFR="SystemRestorePointCreationFrequency → SystemRestore"; LabelEN="SystemRestorePointCreationFrequency → SystemRestore"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore' -Name 'SystemRestorePointCreationFrequency' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=272; Cat="Confidentialite"; LabelFR="Delaydestroyer 28"; LabelEN="Delaydestroyer 28"; Risk="safe"; Action={
    bcdedit /deletevalue useplatformclock >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=273; Cat="Confidentialite"; LabelFR="Delaydestroyer 29"; LabelEN="Delaydestroyer 29"; Risk="safe"; Action={
    bcdedit /set useplatformtick no
}}

$Options += [PSCustomObject]@{Id=274; Cat="Confidentialite"; LabelFR="Delaydestroyer 30"; LabelEN="Delaydestroyer 30"; Risk="safe"; Action={
    bcdedit /set disabledynamictick yes
}}

$Options += [PSCustomObject]@{Id=275; Cat="Confidentialite"; LabelFR="NetworkThrottlingIndex → SystemProfile"; LabelEN="NetworkThrottlingIndex → SystemProfile"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -PropertyType DWord -Value '10' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=276; Cat="Confidentialite"; LabelFR="PlatformAoAcOverride → Power"; LabelEN="PlatformAoAcOverride → Power"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'PlatformAoAcOverride' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=277; Cat="Confidentialite"; LabelFR="MenuShowDelay → Desktop"; LabelEN="MenuShowDelay → Desktop"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=278; Cat="Confidentialite"; LabelFR="MouseHoverTime → Mouse"; LabelEN="MouseHoverTime → Mouse"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Mouse' -Name 'MouseHoverTime' -PropertyType String -Value '10' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=279; Cat="Confidentialite"; LabelFR="MouseSensitivity, SmoothMouseXCurve, SmoothMouseYCurve, MouseSpeed, MouseThreshold1, MouseThreshold2 → Mouse"; LabelEN="MouseSensitivity, SmoothMouseXCurve, SmoothMouseYCurve, MouseSpeed, MouseThreshold1, MouseThreshold2 → Mouse"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Mouse' -Name 'MouseSensitivity' -PropertyType String -Value '10' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Mouse' -Name 'SmoothMouseXCurve' -PropertyType Binary -Value '\' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU:\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Mouse' -Name 'SmoothMouseYCurve' -PropertyType Binary -Value '\' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Name 'MouseSpeed' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Name 'MouseThreshold1' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Name 'MouseThreshold2' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=280; Cat="Confidentialite"; LabelFR="Priority → SystemProfile"; LabelEN="Priority → SystemProfile"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'Priority' -PropertyType DWord -Value '6' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=281; Cat="Confidentialite"; LabelFR="LargeSystemCache → Memory Management"; LabelEN="LargeSystemCache → Memory Management"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'LargeSystemCache' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=282; Cat="Confidentialite"; LabelFR="MinAnimate → WindowMetrics"; LabelEN="MinAnimate → WindowMetrics"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\Control Panel\Desktop\WindowMetrics' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=283; Cat="Confidentialite"; LabelFR="ClearPageFileAtShutdown, FeatureSettings, FeatureSettingsOverrideMask, FeatureSettingsOverride, LargeSystemCache, NonPagedPoolQuota, NonPagedPoolSize, SessionViewSize, SystemPages, SecondLevelDataCache, SessionPoolSize, DisablePagingExecutive, PagedPoolSize, PagedPoolQuota, PhysicalAddressExtension, IoPageLockLimit, PoolUsageMaximum → Memory Management"; LabelEN="ClearPageFileAtShutdown, FeatureSettings, FeatureSettingsOverrideMask, FeatureSettingsOverride, LargeSystemCache, NonPagedPoolQuota, NonPagedPoolSize, SessionViewSize, SystemPages, SecondLevelDataCache, SessionPoolSize, DisablePagingExecutive, PagedPoolSize, PagedPoolQuota, PhysicalAddressExtension, IoPageLockLimit, PoolUsageMaximum → Memory Management"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'ClearPageFileAtShutdown' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'FeatureSettings' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'FeatureSettingsOverrideMask' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'FeatureSettingsOverride' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'LargeSystemCache' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'NonPagedPoolQuota' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'NonPagedPoolSize' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'SessionViewSize' -PropertyType DWord -Value '192' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'SystemPages' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'SecondLevelDataCache' -PropertyType DWord -Value '3072' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'SessionPoolSize' -PropertyType DWord -Value '192' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'DisablePagingExecutive' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PagedPoolSize' -PropertyType DWord -Value '192' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PagedPoolQuota' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PhysicalAddressExtension' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'IoPageLockLimit' -PropertyType DWord -Value '1048576' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PoolUsageMaximum' -PropertyType DWord -Value '96' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=284; Cat="Confidentialite"; LabelFR="SearchOrderConfig → DriverSearching"; LabelEN="SearchOrderConfig → DriverSearching"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching' -Name 'SearchOrderConfig' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=285; Cat="Confidentialite"; LabelFR="StartupDelayInMSec → Serialize"; LabelEN="StartupDelayInMSec → Serialize"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Name 'StartupDelayInMSec' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=286; Cat="Confidentialite"; LabelFR="Start"; LabelEN="Start"; Risk="safe"; Action={
    Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Manual -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Manual -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Manual -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
Set-Service -Name 'Start' -StartupType Disabled -ErrorAction SilentlyContinue; Stop-Service -Name 'Start' -Force -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=287; Cat="Reseau"; LabelFR="TcpAckFrequency, TCPNoDelay → Interfaces"; LabelEN="TcpAckFrequency, TCPNoDelay → Interfaces"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces' -Name 'TcpAckFrequency' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces' -Name 'TCPNoDelay' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}
$Options += [PSCustomObject]@{Id=288; Cat="Processus"; LabelFR="Déprioriser les processus système en arrière-plan (19 process : csrss, dwm, lsass, svchost, winlogon...)"; LabelEN="Deprioritize background system processes (19 processes: csrss, dwm, lsass, svchost, winlogon...)"; Risk="moderate"; Action={
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ApplicationFrameHost.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ApplicationFrameHost.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StartMenu.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StartMenu.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WMIADAP.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WMIADAP.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WmiPrvSE.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WmiPrvSE.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '4' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dllhost.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dllhost.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions' -Name 'PagePriority' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\services.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\services.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smss.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smss.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions' -Name 'MinimumStackCommitInBytes' -PropertyType DWord -Value '32768' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions' -Name 'CpuPriorityClass' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path 'Registry::HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions' -Name 'IoPriority' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}
$Options += [PSCustomObject]@{Id=289; Cat="Bloatwares"; LabelFR="Configure Content Delivery Manager"; LabelEN="Configure Content Delivery Manager"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'FeatureManagementEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContentEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RemediationRequired' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications' -Name 'EnableAccountNotifications' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-310093Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338393Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353694Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353696Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338387Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338388Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338389Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SoftLandingEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=290; Cat="Bloatwares"; LabelFR="Configure Storage Sense"; LabelEN="Configure Storage Sense"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '01' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '1024' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '2048' -PropertyType DWord -Value '30' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '04' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '32' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '02' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '128' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '08' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '256' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName 'SilentCleanup' -TaskPath '\Microsoft\Windows\DiskCleanup\' -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=291; Cat="Bloatwares"; LabelFR="Désactiver Reserved Storage"; LabelEN="Disable Reserved Storage"; Risk="safe"; Action={
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Set-ReservedStorageState /State:Disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=292; Cat="Bloatwares"; LabelFR="Désactiver Scheduled Tasks"; LabelEN="Disable Scheduled Tasks"; Risk="safe"; Action={
    Disable-ScheduledTask -TaskName 'PcaPatchDbTask' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName 'UCPD velocity' -TaskPath '\Microsoft\Windows\AppxDeploymentClient\' -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName 'Microsoft-Windows-DiskDiagnosticDataCollector' -TaskPath '\Microsoft\Windows\DiskDiagnostic\' -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName 'Consolidator' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName 'UsbCeip' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName 'UsageDataReporting' -TaskPath '\Microsoft\Windows\Flighting\FeatureConfig\' -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path 'Registry::HKLM\System\CurrentControlSet\Control\Ubpm' -Name 'CriticalMaintenance_UsageDataReporting' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=293; Cat="Bloatwares"; LabelFR="Hide Unused Windows Sécurité Pages"; LabelEN="Hide Unused Windows Security Pages"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options' -Name 'UILockdown' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health' -Name 'UILockdown' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection' -Name 'UILockdown' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}



$Options += [PSCustomObject]@{Id=295; Cat="Confidentialite"; LabelFR="Add Music & Videos To Home"; LabelEN="Add Music & Videos To Home"; Risk="safe"; Action={
    $o = new-object -com shell.application
$currentPins = $o.Namespace('shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}').Items() | ForEach-Object { $_.Path }
foreach ($path in @(
    [Environment]::GetFolderPath('MyVideos'),
    [Environment]::GetFolderPath('MyMusic')
)) {
    if ($currentPins -notcontains $path) {
        $o.Namespace($path).Self.InvokeVerb('pintohome')
    }
}

}}



$Options += [PSCustomObject]@{Id=297; Cat="Confidentialite"; LabelFR="Configure OEM Information"; LabelEN="Configure OEM Information"; Risk="safe"; Action={
    $version = 'v0.5.0'

Write-Output 'Setting boot entry name...'
bcdedit /set description """AtlasOS $(('10', '11')[[int]([System.Environment]::OSVersion.Version.Build -ge 22000)]) $version"""

Write-Output 'Setting other versioned OEM information...'
$reportedVer = """Atlas Playbook $version"""
# Shows in Settings
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Name 'Model' -Value $reportedVer -Force
# Shows in winver
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name 'RegisteredOrganization' -Value $reportedVer -Force

New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Name 'Manufacturer' -PropertyType String -Value 'Atlas Team' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Name 'SupportURL' -PropertyType String -Value 'https://discord.atlasos.net' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -Name 'SupportPhone' -PropertyType String -Value 'https://github.com/Atlas-OS/Atlas' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=298; Cat="Confidentialite"; LabelFR="Configure Time Servers"; LabelEN="Configure Time Servers"; Risk="safe"; Action={
    Stop-Service -Name 'w32time' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'w32time' -StartupType Manual -ErrorAction SilentlyContinue
Start-Process -FilePath 'w32tm' -ArgumentList '/config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'w32tm' -ArgumentList '/config /update' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'w32tm' -ArgumentList '/resync' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=299; Cat="Confidentialite"; LabelFR="Create Shortcuts"; LabelEN="Create Shortcuts"; Risk="safe"; Action={
    .\SHORTCUTS.ps1
}}





$Options += [PSCustomObject]@{Id=302; Cat="Confidentialite"; LabelFR="Activer Windows Recovery Environment"; LabelEN="Enable Windows Recovery Environment"; Risk="safe"; Action={
    reagentc /enable
}}



$Options += [PSCustomObject]@{Id=304; Cat="Confidentialite"; LabelFR="Rebuild Performance Counters"; LabelEN="Rebuild Performance Counters"; Risk="safe"; Action={
    Start-Process -FilePath 'lodctr' -ArgumentList '/r' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'lodctr' -ArgumentList '/r' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'winmgmt' -ArgumentList '/resyncperf' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=305; Cat="Confidentialite"; LabelFR="Removes the drive letter from the EFI partition."; LabelEN="Removes the drive letter from the EFI partition."; Risk="safe"; Action={
    try {
  # Find EFI System Partition on any disk
  $efiPartition = Get-Partition | Where-Object { $_.GptType -eq '{C12A7328-F81F-11D2-BA4B-00A0C93EC93B}' } | Select-Object -First 1

  if ($null -eq $efiPartition) {
    Write-Output "No EFI partition found, skipping."
    exit 0
  }

  if ([string]::IsNullOrEmpty($efiPartition.DriveLetter)) {
    Write-Output "EFI partition has no drive letter, skipping."
    exit 0
  }

  Write-Output "Removing drive letter '$($efiPartition.DriveLetter):' from EFI partition..."
  Remove-PartitionAccessPath -DiskNumber $efiPartition.DiskNumber -PartitionNumber $efiPartition.PartitionNumber -AccessPath "$($efiPartition.DriveLetter):\"
  Write-Output "Successfully removed EFI partition drive letter."
}
catch {
  Write-Output "Failed to remove EFI partition drive letter: $_"
  # Non-fatal error, continue installation
  exit 0
}

}}





$Options += [PSCustomObject]@{Id=308; Cat="Confidentialite"; LabelFR="Change the Tooltip Color to Blue"; LabelEN="Change the Tooltip Color to Blue"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Colors' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Colors' -Name 'InfoWindow' -PropertyType String -Value '246 253 255' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=309; Cat="Confidentialite"; LabelFR="Disallow Themes to Change Certain Personalized Features"; LabelEN="Disallow Themes to Change Certain Personalized Features"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeChangesMousePointers' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeChangesDesktopIcons' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=310; Cat="Confidentialite"; LabelFR="Configure Boot Configuration"; LabelEN="Configure Boot Configuration"; Risk="safe"; Action={
    Start-Process -FilePath 'bcdedit' -ArgumentList '/timeout 10' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'bcdedit' -ArgumentList '/set bootmenupolicy legacy' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=311; Cat="Confidentialite"; LabelFR="Désactiver Wallpaper Compression"; LabelEN="Disable Wallpaper Compression"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'JPEGImportQuality' -PropertyType DWord -Value '100' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=312; Cat="Confidentialite"; LabelFR="Configure PowerShell"; LabelEN="Configure PowerShell"; Risk="safe"; Action={
    setx POWERSHELL_TELEMETRY_OPTOUT 1
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell' -Name 'ExecutionPolicy' -PropertyType String -Value 'Unrestricted' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=313; Cat="Confidentialite"; LabelFR="Configure Start Menu"; LabelEN="Configure Start Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start' -Name 'ConfigureStartPins' -PropertyType String -Value '{"pinnedList":[{"packagedAppId":"windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel"},{"packagedAppId":"Microsoft.WindowsTerminal_8wekyb3d8bbwe!App"},{"desktopAppLink":"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\File Explorer.lnk"},{"packagedAppId":"Microsoft.WindowsStore_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.GamingApp_8wekyb3d8bbwe!Microsoft.Xbox.App"},{"packagedAppId":"Microsoft.WindowsCalculator_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.WindowsNotepad_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.Paint_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.SecHealthUI_8wekyb3d8bbwe!SecHealthUI"}]}' -Force -ErrorAction SilentlyContinue | Out-Null
taskkill /IM StartMenuExperienceHost /F 2>$null
.\STARTMENU.ps1
Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.StartMenuExperienceHost*' | Remove-AppxPackage -ErrorAction SilentlyContinue
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoStartMenuMFUprogramsList' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'ShowOrHideMostUsedApps' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'HideRecentlyAddedApps' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'HideRecommendedPersonalizedSites' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=314; Cat="Confidentialite"; LabelFR="Configure Windows Ink Workspace"; LabelEN="Configure Windows Ink Workspace"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace' -Name 'PenWorkspaceAppSuggestionsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=315; Cat="Confidentialite"; LabelFR="Disable Automatic Store App Archiving"; LabelEN="Disable Automatic Store App Archiving"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\Appx' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\Appx' -Name 'AllowAutomaticAppArchiving' -PropertyType DWord -Value '0 ' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=316; Cat="Confidentialite"; LabelFR="Désactiver Dynamic Lighting"; LabelEN="Disable Dynamic Lighting"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Lighting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Lighting' -Name 'AmbientLightingEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=317; Cat="Confidentialite"; LabelFR="Désactiver Mouse Acceleration"; LabelEN="Disable Mouse Acceleration"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Mouse' -Name 'MouseSpeed' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Mouse' -Name 'MouseThreshold1' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Mouse' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Mouse' -Name 'MouseThreshold2' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=318; Cat="Confidentialite"; LabelFR="Désactiver Cross Device Resume"; LabelEN="Disable Cross Device Resume"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume\Configuration' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume\Configuration' -Name 'IsResumeAllowed' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\PolicyManager\default\Connectivity\DisableCrossDeviceResume' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\PolicyManager\default\Connectivity\DisableCrossDeviceResume' -Name 'Value' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=319; Cat="Confidentialite"; LabelFR="Désactiver Screen Capture Hotkey"; LabelEN="Disable Screen Capture Hotkey"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Keyboard' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Keyboard' -Name 'PrintScreenKeyForSnippingEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=320; Cat="Confidentialite"; LabelFR="Désactiver Settings Tips"; LabelEN="Disable Settings Tips"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowOnlineTips' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowOnlineTips' -Name 'value' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'AllowOnlineTips' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=321; Cat="Confidentialite"; LabelFR="Désactiver Spell Checking"; LabelEN="Disable Spell Checking"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableAutocorrection' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableDoubleTapSpace' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnablePredictionSpaceInsertion' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableSpellchecking' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableTextPrediction' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=322; Cat="Confidentialite"; LabelFR="Désactiver Automatic Mises à jour for Apps in Store"; LabelEN="Disable Automatic Updates for Apps in Store"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate' -Name 'AutoDownload' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=323; Cat="Confidentialite"; LabelFR="Désactiver Tips"; LabelEN="Disable Tips"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableSoftLanding' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=324; Cat="Confidentialite"; LabelFR="Désactiver Unnecessary Touch Keyboard Settings"; LabelEN="Disable Unnecessary Touch Keyboard Settings"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableAutoShiftEngage' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableKeyAudioFeedback' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=325; Cat="Confidentialite"; LabelFR="Désactiver Touch Visual Feedback"; LabelEN="Disable Touch Visual Feedback"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Cursors' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Cursors' -Name 'GestureVisualization' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Cursors' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Cursors' -Name 'ContactVisualization' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=326; Cat="Confidentialite"; LabelFR="Désactiver 'Notify About USB Issues'"; LabelEN="Disable 'Notify About USB Issues'"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Shell\USB' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Shell\USB' -Name 'NotifyOnUsbErrors' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Shell\USB' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Shell\USB' -Name 'NotifyOnWeakCharger' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=327; Cat="Confidentialite"; LabelFR="Désactiver Windows 11 Settings Banner"; LabelEN="Disable Windows 11 Settings Banner"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\ValueBanner.IdealStateFeatureControlProvider' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\ValueBanner.IdealStateFeatureControlProvider' -Name 'ActivationType' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=328; Cat="Confidentialite"; LabelFR="Désactiver Windows Feedback"; LabelEN="Disable Windows Feedback"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Siuf\Rules' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Siuf\Rules' -Name 'NumberOfSIUFInPeriod' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -ErrorAction SilentlyContinue
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'DoNotShowFeedbackNotifications' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=329; Cat="Confidentialite"; LabelFR="Désactiver Windows Spotlight"; LabelEN="Disable Windows Spotlight"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsSpotlightFeatures' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsSpotlightWindowsWelcomeExperience' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsSpotlightOnActionCenter' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsSpotlightOnSettings' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableThirdPartySuggestions' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanelt' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanelt' -Name '{2cc5ca98-6485-489a-920e-b3e88a6ccce3}' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=330; Cat="Confidentialite"; LabelFR="Do Not Reduce Sounds While in a Call"; LabelEN="Do Not Reduce Sounds While in a Call"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Multimedia\Audio' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Multimedia\Audio' -Name 'UserDuckingPreference' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=331; Cat="Confidentialite"; LabelFR="Désactiver 'Always Read and Scan This Section'"; LabelEN="Disable 'Always Read and Scan This Section'"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Ease of Access' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Ease of Access' -Name 'selfscan' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Ease of Access' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Ease of Access' -Name 'selfvoice' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=332; Cat="Confidentialite"; LabelFR="Désactiver Commonly Annoying Features and Shortcuts"; LabelEN="Disable Commonly Annoying Features and Shortcuts"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\HighContrast' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\HighContrast' -Name 'Flags' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\Keyboard Response' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\Keyboard Response' -Name 'Flags' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Name 'Flags' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\StickyKeys' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\ToggleKeys' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\ToggleKeys' -Name 'Flags' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Input Method\Hot Keys\00000104' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Keyboard Layout\Toggle' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Keyboard Layout\Toggle' -Name 'Layout Hotkey' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Keyboard Layout\Toggle' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Keyboard Layout\Toggle' -Name 'Language Hotkey' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Keyboard Layout\Toggle' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Keyboard Layout\Toggle' -Name 'Hotkey' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Narrator\NoRoam' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Narrator\NoRoam' -Name 'WinEnterLaunchEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=333; Cat="Confidentialite"; LabelFR="Désactiver Accessibility Tool Shortcut"; LabelEN="Disable Accessibility Tool Shortcut"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\SlateLaunch' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\SlateLaunch' -Name 'LaunchAT' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=334; Cat="Confidentialite"; LabelFR="Désactiver Accessibilité Sounds"; LabelEN="Disable Ease of Access Sounds"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility' -Name 'Warning Sounds' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Accessibility' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility' -Name 'Sound on Activation' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\SoundSentry' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\SoundSentry' -Name 'WindowsEffect' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}



$Options += [PSCustomObject]@{Id=336; Cat="Confidentialite"; LabelFR="Adds Batch Scripts to 'New' Context Menu"; LabelEN="Adds Batch Scripts to 'New' Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\.bat\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.bat\ShellNew' -Name 'ItemName' -PropertyType ExpandString -Value '%windir%\System32\acppage.dll,-6002' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\.bat\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.bat\ShellNew' -Name 'NullFile' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=337; Cat="Confidentialite"; LabelFR="Add PowerShell Script to 'New' Context Menu"; LabelEN="Add PowerShell Script to 'New' Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\.ps1' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.ps1' -Name '' -PropertyType String -Value 'Microsoft.PowerShellScript.1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\.ps1\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.ps1\ShellNew' -Name 'NullFile' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\Microsoft.PowerShellScript.1' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\Microsoft.PowerShellScript.1' -Name '' -PropertyType String -Value 'Windows PowerShell Script' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\Microsoft.PowerShellScript.1' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\Microsoft.PowerShellScript.1' -Name 'FriendlyTypeName' -PropertyType String -Value 'Windows PowerShell Script' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=338; Cat="Confidentialite"; LabelFR="Add Registry Entries to 'New' Context Menu"; LabelEN="Add Registry Entries to 'New' Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\.reg\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.reg\ShellNew' -Name 'NullFile' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\.reg\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.reg\ShellNew' -Name 'ItemName' -PropertyType ExpandString -Value '%windir%\regedit.exe,-309' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=339; Cat="Confidentialite"; LabelFR="Show More Details by Default on Transfers"; LabelEN="Show More Details by Default on Transfers"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager' -Name 'EnthusiastMode' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=340; Cat="Confidentialite"; LabelFR="Revert to Classic Search"; LabelEN="Revert to Classic Search"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\CLSID\{1d64637d-31e9-4b06-9124-e83fb178ac6e}\TreatAs' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Classes\CLSID\{1d64637d-31e9-4b06-9124-e83fb178ac6e}\TreatAs' -Name '' -PropertyType String -Value '{64bc32b5-4eec-4de7-972d-bd8bd0324537}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{1d64637d-31e9-4b06-9124-e83fb178ac6e}\TreatAs' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{1d64637d-31e9-4b06-9124-e83fb178ac6e}\TreatAs' -Name '' -PropertyType String -Value '{64bc32b5-4eec-4de7-972d-bd8bd0324537}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{1d64637d-31e9-4b06-9124-e83fb178ac6e}\TreatAs' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{1d64637d-31e9-4b06-9124-e83fb178ac6e}\TreatAs' -Name '' -PropertyType String -Value '{64bc32b5-4eec-4de7-972d-bd8bd0324537}' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=341; Cat="Confidentialite"; LabelFR="Désactiver Use Check Boxes to Select Items"; LabelEN="Disable Use Check Boxes to Select Items"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'AutoCheckSelect' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=342; Cat="Confidentialite"; LabelFR="Hide Folders from This PC"; LabelEN="Hide Folders from This PC"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag' -Name 'ThisPCPolicy' -PropertyType String -Value 'Hide' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=343; Cat="Confidentialite"; LabelFR="Hide Gallery in File Explorer"; LabelEN="Hide Gallery in File Explorer"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=344; Cat="Confidentialite"; LabelFR="Désactiver Searching for Invalid Shortcuts"; LabelEN="Disable Searching for Invalid Shortcuts"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoResolveSearch' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoResolveTrack' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=345; Cat="Confidentialite"; LabelFR="Disable Network Navigation Pane in Explorer"; LabelEN="Disable Network Navigation Pane in Explorer"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}' -Name 'System.IsPinnedToNameSpaceTree' -PropertyType DWord -Value '0 ' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=346; Cat="Confidentialite"; LabelFR="Don't Show Office Files"; LabelEN="Don't Show Office Files"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'ShowCloudFilesInQuickAccess' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=347; Cat="Confidentialite"; LabelFR="Activer Long Paths"; LabelEN="Enable Long Paths"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\FileSystem' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=348; Cat="Confidentialite"; LabelFR="Extend Icon Cache"; LabelEN="Extend Icon Cache"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'Max Cached Icons' -PropertyType String -Value '4096' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=349; Cat="Confidentialite"; LabelFR="Always Show the Full Context Menu On Items"; LabelEN="Always Show the Full Context Menu On Items"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'MultipleInvokePromptMinimum' -PropertyType DWord -Value '100' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=350; Cat="Confidentialite"; LabelFR="Hide Recent Items"; LabelEN="Hide Recent Items"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'ShowFrequent' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'ShowRecent' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_TrackDocs' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'ClearRecentDocsOnExit' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoRecentDocsHistory' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoRemoteDestinations' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=351; Cat="Confidentialite"; LabelFR="Add Power Plan File Association"; LabelEN="Add Power Plan File Association"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\powerscheme\DefaultIcon' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\powerscheme\DefaultIcon' -Name '' -PropertyType String -Value '%windir%\System32\powercpl.dll,1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\powerscheme\Shell\open\command' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\powerscheme\Shell\open\command' -Name '' -PropertyType String -Value 'powercfg /import "%1"' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\.pow' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.pow' -Name '' -PropertyType String -Value 'powerscheme' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\.pow' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\.pow' -Name 'FriendlyTypeName' -PropertyType String -Value 'Power Scheme' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=352; Cat="Confidentialite"; LabelFR="Minimize Mouse Hover Time for Item Info"; LabelEN="Minimize Mouse Hover Time for Item Info"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'MouseHoverTime' -PropertyType String -Value '20' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=353; Cat="Confidentialite"; LabelFR="Désactiver Internet File Association Service"; LabelEN="Disable Internet File Association Service"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoInternetOpenWith' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=354; Cat="Confidentialite"; LabelFR="Open File Explorateur to This PC"; LabelEN="Open File Explorer to This PC"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=355; Cat="Confidentialite"; LabelFR="Show Removable Drives Only in 'This PC'"; LabelEN="Show Removable Drives Only in 'This PC'"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=356; Cat="Confidentialite"; LabelFR="Retirer 'Cast to device' from Context Menu"; LabelEN="Remove 'Cast to device' from Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{7AD84985-87B4-4a16-BE58-8B72A5B390F7}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=357; Cat="Confidentialite"; LabelFR="Remove 'Extract' from Context Menu"; LabelEN="Remove 'Extract' from Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{b8cdcb65-b1bf-4b42-9428-1dfdb7ee92af}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{BD472F60-27FA-11cf-B8B4-444553540000}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{EE07CEF5-3441-4CFB-870A-4002C724783A}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{D12E3394-DE4B-4777-93E9-DF0AC88F8584}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=358; Cat="Confidentialite"; LabelFR="Retirer 'Include in Library' from Context Menu"; LabelEN="Remove 'Include in Library' from Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=359; Cat="Confidentialite"; LabelFR="Retirer Bitmap Image from 'New' Context Menu"; LabelEN="Remove Bitmap Image from 'New' Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\.bmp\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=360; Cat="Confidentialite"; LabelFR="Retirer Rich Text Document from 'New' Context Menu"; LabelEN="Remove Rich Text Document from 'New' Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\.rtf\ShellNew' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=361; Cat="Confidentialite"; LabelFR="Retirer 'Edit with Paint 3D' from Context Menu"; LabelEN="Remove 'Edit with Paint 3D' from Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\SystemFileAssociations\.3mf\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.bmp\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.fbx\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.gif\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.jfif\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.jpe\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.jpeg\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.jpg\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.png\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.tif\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\.tiff\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=362; Cat="Confidentialite"; LabelFR="Remove 'Printing' from Context Menus"; LabelEN="Remove 'Printing' from Context Menus"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\SystemFileAssociations\image\shell\print' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\print' -Name 'ProgrammaticAccessOnly' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print' -Name 'LegacyDisable' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print' -Name 'ProgrammaticAccessOnly' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print' -Name 'HideBasedOnVelocityId' -PropertyType DWord -Value '6527944' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo' -Name 'LegacyDisable' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo' -Name 'ProgrammaticAccessOnly' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo' -Name 'HideBasedOnVelocityId' -PropertyType DWord -Value '6527944' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=363; Cat="Confidentialite"; LabelFR="Retirer 'Share' from Context Menu"; LabelEN="Remove 'Share' from Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\ModernSharing' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=364; Cat="Confidentialite"; LabelFR="Retirer 'Troubleshooting Compatibility' from Context Menu"; LabelEN="Remove 'Troubleshooting Compatibility' from Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{1d27f844-3a1f-4410-85ac-14651078412d}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked' -Name '{1d27f844-3a1f-4410-85ac-14651078412d}' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=365; Cat="Confidentialite"; LabelFR="Retirer Previous Versions from Explorateur"; LabelEN="Remove Previous Versions from Explorer"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\Drive\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Force -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'NoPreviousVersionsPage' -ErrorAction SilentlyContinue
Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\PreviousVersions' -Name 'DisableLocalPage' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=366; Cat="Confidentialite"; LabelFR="Retirer Shortcut Text"; LabelEN="Remove Shortcut Text"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates' -Name 'ShortcutNameTemplate' -PropertyType String -Value '"%s.lnk"' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=367; Cat="Confidentialite"; LabelFR="Configure Explorateur to Show All Files with File Extensions"; LabelEN="Configure Explorer to Show All Files with File Extensions"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=368; Cat="Confidentialite"; LabelFR="Use Compact Mode"; LabelEN="Use Compact Mode"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'UseCompactMode' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=369; Cat="Confidentialite"; LabelFR="Hide Disabled and Disconnected Devices in Sounds Panel"; LabelEN="Hide Disabled and Disconnected Devices in Sounds Panel"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl' -Name 'ShowDisconnectedDevices' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl' -Name 'ShowHiddenDevices' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=370; Cat="Confidentialite"; LabelFR="Désactiver UAC Secure Desktop"; LabelEN="Disable UAC Secure Desktop"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'PromptOnSecureDesktop' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=371; Cat="Confidentialite"; LabelFR="Set Hidden Pages"; LabelEN="Set Hidden Pages"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'SettingsPageVisibility' -PropertyType String -Value 'hide:recovery;maps;maps-downloadmaps;privacy;privacy-speechtyping;privacy-speech;privacy-feedback;privacy-activityhistory;search-permissions;privacy-general;sync;mobile-devices;mobile-devices-addphone;workplace;backup' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'SettingsPageVisibility' -PropertyType String -Value 'hide:recovery;maps;maps-downloadmaps;privacy;privacy-feedback;privacy-activityhistory;search-permissions;privacy-general;sync;mobile-devices;mobile-devices-addphone;workplace;family-group;deviceusage;home' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=372; Cat="Confidentialite"; LabelFR="Do Not Show Edge Tabs in Alt-Tab"; LabelEN="Do Not Show Edge Tabs in Alt-Tab"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'MultiTaskingAltTabFilter' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=373; Cat="Confidentialite"; LabelFR="Désactiver AutoRun"; LabelEN="Disable AutoRun"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers' -Name 'DisableAutoplay' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\CameraAlternate' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\CameraAlternate' -Name 'MSTakeNoAction' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\StorageOnArrival' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\StorageOnArrival' -Name 'MSTakeNoAction' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\CameraAlternate\ShowPicturesOnArrival' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\CameraAlternate\ShowPicturesOnArrival' -Name 'MSTakeNoAction' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\StorageOnArrival' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\StorageOnArrival' -Name 'MSTakeNoAction' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=374; Cat="Confidentialite"; LabelFR="Désactiver Aero Shake"; LabelEN="Disable Aero Shake"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'DisallowShaking' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=375; Cat="Confidentialite"; LabelFR="Désactiver Low Disk Space Checks"; LabelEN="Disable Low Disk Space Checks"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoLowDiskSpaceChecks' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=376; Cat="Confidentialite"; LabelFR="Désactiver Menu Hover Delay"; LabelEN="Disable Menu Hover Delay"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'MenuShowDelay' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=377; Cat="Confidentialite"; LabelFR="Désactiver Shared Experiences"; LabelEN="Disable Shared Experiences"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CDP\SettingsPage' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CDP\SettingsPage' -Name 'BluetoothLastDisabledNearShare' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CDP' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CDP' -Name 'NearShareChannelUserAuthzPolicy' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CDP' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\CDP' -Name 'CdpSessionUserAuthzPolicy' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=378; Cat="Confidentialite"; LabelFR="Désactiver Réseau Location Wizard"; LabelEN="Disable Network Location Wizard"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=379; Cat="Confidentialite"; LabelFR="Désactiver Recommendations in the Start Menu"; LabelEN="Disable Recommendations in the Start Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_IrisRecommendations' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_AccountNotifications' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=380; Cat="Confidentialite"; LabelFR="Restore Old Context Menu"; LabelEN="Restore Old Context Menu"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' -Name '' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /t REG_SZ /d "" /f > nul
}}

$Options += [PSCustomObject]@{Id=381; Cat="Confidentialite"; LabelFR="Set Unpinned Control Center Items"; LabelEN="Set Unpinned Control Center Items"; Risk="safe"; Action={
    taskkill /IM explorer /F 2>$null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Name 'Microsoft.QuickAction.Connect' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Name 'Microsoft.QuickAction.Location' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Name 'Microsoft.QuickAction.ScreenClipping' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\QuickActionsStateCapture' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\QuickActionsStateCapture' -Name 'Toggles' -PropertyType String -Value 'Toggles,Microsoft.QuickAction.BlueLightReduction:false,Microsoft.QuickAction.AllSettings:false,Microsoft.QuickAction.Project:false' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Name 'Microsoft.QuickAction.Cast' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\Unpinned' -Name 'Microsoft.QuickAction.NearShare' -PropertyType DWord -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\QuickActionsStateCapture' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Quick Actions\Control Center\QuickActionsStateCapture' -Name 'Toggles' -PropertyType String -Value 'Toggles,Microsoft.QuickAction.BlueLightReduction:false,Microsoft.QuickAction.Accessibility:false,Microsoft.QuickAction.ProjectL2:false' -Force -ErrorAction SilentlyContinue | Out-Null
Start-Process -FilePath 'explorer.exe' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=382; Cat="Confidentialite"; LabelFR="Show More Pins in Start"; LabelEN="Show More Pins in Start"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_Layout' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=383; Cat="Confidentialite"; LabelFR="Show All Tasks in Control Panel"; LabelEN="Show All Tasks in Control Panel"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Name 'None' -PropertyType String -Value 'All Tasks' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Name 'InfoTip' -PropertyType String -Value 'View list of all Control Panel tasks' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Name 'System.ControlPanel.Category' -PropertyType String -Value '5' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}\DefaultIcon' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}\DefaultIcon' -Name 'None' -PropertyType String -Value '%windir%\System32\imageres.dll,-27' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}\Shell\Open\Command' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCR\CLSID\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}\Shell\Open\Command' -Name 'None' -PropertyType String -Value 'explorer.exe shell:::{ED7BA470-8E54-465E-825C-99712043E01C}' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{D15ED2E1-C75B-443c-BD7C-FC03B2F08C17}' -Name 'None' -PropertyType String -Value 'All Tasks' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=384; Cat="Confidentialite"; LabelFR="Decrease Arrêt Time"; LabelEN="Decrease Shutdown Time"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'HungAppTimeout' -PropertyType String -Value '2000' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'WaitToKillAppTimeOut' -PropertyType String -Value '2000' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control' -Name 'WaitToKillServiceTimeout' -PropertyType String -Value '2000' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=385; Cat="Confidentialite"; LabelFR="Désactiver Démarrage Delay"; LabelEN="Disable Startup Delay"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Name 'StartupDelayInMSec' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=386; Cat="Confidentialite"; LabelFR="Activer verbose startup, shutdown, logon, and logoff status messages"; LabelEN="Enable verbose startup, shutdown, logon, and logoff status messages"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'verbosestatus' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=387; Cat="Confidentialite"; LabelFR="Force Close Applications On Session End"; LabelEN="Force Close Applications On Session End"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'AutoEndTasks' -PropertyType String -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=388; Cat="Confidentialite"; LabelFR="Configure Crash Control"; LabelEN="Configure Crash Control"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Name 'AutoReboot' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Name 'CrashDumpEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Name 'LogEvent' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' -Name 'DisplayParameters' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\StorageTelemetry' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\StorageTelemetry' -Name 'DeviceDumpEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=389; Cat="Confidentialite"; LabelFR="Désactiver Windows Platform Binary Table Execution (WPBT)"; LabelEN="Disable Windows Platform Binary Table Execution (WPBT)"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager' -Name 'DisableWpbtExecution' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=390; Cat="Confidentialite"; LabelFR="Show Command Prompt on Win+X"; LabelEN="Show Command Prompt on Win+X"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'DontUsePowerShellOnWinX' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=391; Cat="Confidentialite"; LabelFR="Configure Barre des tâches Pins"; LabelEN="Configure Taskbar Pins"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband' -Name 'FavoritesVersion' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins' -Name 'MailPin' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins' -Name 'CopilotPWAPin' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Name 'browser' -PropertyType String -Value 'Brave' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Name 'browser' -PropertyType String -Value 'Firefox' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Name 'browser' -PropertyType String -Value 'Google Chrome' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Name 'browser' -PropertyType String -Value 'LibreWolf' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\SetupOptions' -Name 'browser' -PropertyType String -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
.\TASKBARPINS.ps1
.\TASKBARPINS.ps1 'Brave'
.\TASKBARPINS.ps1 'Firefox'
.\TASKBARPINS.ps1 'Google Chrome'
.\TASKBARPINS.ps1 'LibreWolf'
}}

$Options += [PSCustomObject]@{Id=392; Cat="Confidentialite"; LabelFR="Désactiver Cloud Optimized Content on Barre des tâches"; LabelEN="Disable Cloud Optimized Content on Taskbar"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableCloudOptimizedContent' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=393; Cat="Confidentialite"; LabelFR="Désactiver Microsoft Copilot"; LabelEN="Disable Microsoft Copilot"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot' -Name 'TurnOffWindowsCopilot' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=394; Cat="Confidentialite"; LabelFR="Désactiver Show Desktop Peek on Barre des tâches"; LabelEN="Disable Show Desktop Peek on Taskbar"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'DisablePreviewDesktop' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=395; Cat="Confidentialite"; LabelFR="Désactiver News and Interests"; LabelEN="Disable News and Interests"; Risk="safe"; Action={
    taskkill /IM explorer /F 2>$null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' -Name 'EnableFeeds' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Dsh' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Dsh' -Name 'AllowNewsAndInterests' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
Start-Process -FilePath 'explorer.exe' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=396; Cat="Confidentialite"; LabelFR="Never Use Tablet Mode"; LabelEN="Never Use Tablet Mode"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell' -Name 'SignInMode' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=397; Cat="Confidentialite"; LabelFR="Désactiver Windows Chat"; LabelEN="Disable Windows Chat"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat' -Name 'ChatIcon' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarMn' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=398; Cat="Confidentialite"; LabelFR="Add 'End task' to the taskbar"; LabelEN="Add 'End task' to the taskbar"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings' -Name 'TaskbarEndTask' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=399; Cat="Confidentialite"; LabelFR="Hide 'Meet Now' on Barre des tâches"; LabelEN="Hide 'Meet Now' on Taskbar"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'HideSCAMeetNow' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=400; Cat="Confidentialite"; LabelFR="Désactiver Task View on Barre des tâches"; LabelEN="Disable Task View on Taskbar"; Risk="safe"; Action={
    Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultiTaskingView\AllUpView' -Name 'Enabled' -ErrorAction SilentlyContinue
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=401; Cat="Confidentialite"; LabelFR="Set Barre des tâches to Align Left"; LabelEN="Set Taskbar to Align Left"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAl' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=402; Cat="Confidentialite"; LabelFR="Configure Visual Effects"; LabelEN="Configure Visual Effects"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'FontSmoothing' -PropertyType String -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'UserPreferencesMask' -PropertyType Binary -Value '9012038010000000' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Desktop' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop' -Name 'DragFullWindows' -PropertyType String -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Control Panel\Desktop\WindowMetrics' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -PropertyType String -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ListviewAlphaSelect' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'IconsOnly' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAnimations' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ListviewShadow' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\DWM' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\DWM' -Name 'EnableAeroPeek' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\DWM' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\DWM' -Name 'AlwaysHibernateThumbnails' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=403; Cat="Confidentialite"; LabelFR="Désactiver WU Auto-Reboot"; LabelEN="Disable WU Auto-Reboot"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AUPowerManagement' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoRebootWithLoggedOnUsers' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=404; Cat="Confidentialite"; LabelFR="Disable WU Auto-Updates"; LabelEN="Disable WU Auto-Updates"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AUOptions' -PropertyType DWord -Value '2 ' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=405; Cat="Confidentialite"; LabelFR="Désactiver Delivery Optimization"; LabelEN="Disable Delivery Optimization"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Name 'DODownloadMode' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=406; Cat="Confidentialite"; LabelFR="Désactiver Fonctionnalité Mises à jour"; LabelEN="Disable Feature Updates"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'TargetReleaseVersion' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
if ((Get-CimInstance -Class Win32_OperatingSystem).Caption -match 11) {$a = 'Windows 11'} else {$a = 'Windows 10'}; New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ProductVersion' -Value $a -PropertyType String -Force
$ver = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').DisplayVersion; New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'TargetReleaseVersion' -Value $ver -PropertyType String -Force
}}

$Options += [PSCustomObject]@{Id=407; Cat="Confidentialite"; LabelFR="Restrict Windows Insider"; LabelEN="Restrict Windows Insider"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ManagePreviewBuilds' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ManagePreviewBuildsPolicyValue' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Name 'AllowBuildPreview' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Name 'EnableConfigFlighting' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Name 'EnableExperimentation' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility' -Name 'HideInsiderPage' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=408; Cat="Confidentialite"; LabelFR="Désactiver MSRT telemetry"; LabelEN="Disable MSRT telemetry"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\MRT' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\MRT' -Name 'DontReportInfectionInformation' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\RemovalTools\MpGears' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\RemovalTools\MpGears' -Name 'HeartbeatTrackingIndex' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\RemovalTools\MpGears' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\RemovalTools\MpGears' -Name 'SpyNetReportingLocation' -PropertyType MultiString -Value '' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=409; Cat="Confidentialite"; LabelFR="Désactiver WU Nagging"; LabelEN="Disable WU Nagging"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAUAsDefaultShutdownOption' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'HideMCTLink' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=410; Cat="Confidentialite"; LabelFR="Blocks Anonymous Enumeration of SAM Accounts"; LabelEN="Blocks Anonymous Enumeration of SAM Accounts"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RestrictAnonymousSAM' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=411; Cat="Confidentialite"; LabelFR="Désactiver Remote Assistance"; LabelEN="Disable Remote Assistance"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' -Name 'fAllowFullControl' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' -Name 'fAllowToGetHelp' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
Start-Process -FilePath 'netsh' -ArgumentList 'advfirewall firewall set rule group="Remote Assistance" new enable=no' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=412; Cat="Reseau"; LabelFR="Applies Atlas' Network Settings"; LabelEN="Applies Atlas' Network Settings"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=413; Cat="Reseau"; LabelFR="Désactiver LLMNR Protocol"; LabelEN="Disable LLMNR Protocol"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Name 'EnableMulticast' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=414; Cat="Reseau"; LabelFR="Désactiver SMB Bandwidth Throttling"; LabelEN="Disable SMB Bandwidth Throttling"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'DisableBandwidthThrottling' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=415; Cat="Reseau"; LabelFR="Restrict Anonymous Access"; LabelEN="Restrict Anonymous Access"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' -Name 'RestrictNullSessAccess' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=416; Cat="Reseau"; LabelFR="Restrict Anonymous Enumeration of Shares"; LabelEN="Restrict Anonymous Enumeration of Shares"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RestrictAnonymous' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=417; Cat="Extreme"; LabelFR="Configure Automatic Maintenance"; LabelEN="Configure Automatic Maintenance"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance' -Name 'WakeUp' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=418; Cat="Extreme"; LabelFR="Configure the Multimedia Class Scheduler Service"; LabelEN="Configure the Multimedia Class Scheduler Service"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -PropertyType DWord -Value '10' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=419; Cat="Extreme"; LabelFR="Disable Automatic Folder Discovery"; LabelEN="Disable Automatic Folder Discovery"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell' -Name 'FolderType' -PropertyType String -Value 'NotSpecified' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=420; Cat="Extreme"; LabelFR="Désactiver Background Apps"; LabelEN="Disable Background Apps"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BackgroundAppGlobalToggle' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=421; Cat="Extreme"; LabelFR="Désactiver Fault Tolerant Heap (FTH)"; LabelEN="Disable Fault Tolerant Heap (FTH)"; Risk="moderate"; Action={
Start-Process -FilePath 'rundll32.exe' -ArgumentList 'fthsvc.dll,FthSysprepSpecialize' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\FTH' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\FTH' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}
$Options += [PSCustomObject]@{Id=463; Cat="Nettoyage"; LabelFR="Tuer les process bloat avant d'appliquer les tweaks"; LabelEN="Kill bloat processes before applying tweaks"; Risk="safe"; Action={
    taskkill /IM explorer /F 2>$null
    taskkill /IM SearchApp /F 2>$null
    taskkill /IM SearchHost /F 2>$null
    taskkill /IM RuntimeBroker /F 2>$null
    taskkill /IM TextInputHost /F 2>$null
    taskkill /IM ShellExperienceHost /F 2>$null
    taskkill /IM backgroundTaskHost /F 2>$null
    taskkill /IM Widgets /F 2>$null
    taskkill /IM MicrosoftEdge* /F 2>$null
    taskkill /IM msedge /F 2>$null
    taskkill /IM OneDrive /F 2>$null
}}
$Options += [PSCustomObject]@{Id=464; Cat="Bloatwares"; LabelFR="AppX"; LabelEN="AppX"; Risk="moderate"; Action={
    taskkill /IM msteams* /F 2>$null
    Get-AppxPackage -AllUsers -Name 'MicrosoftTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications' -Name 'ConfigureChatAutoInstall' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
    taskkill /IM ms-teams* /F 2>$null
    Get-AppxPackage -AllUsers -Name 'MSTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Copilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Clipchamp.Clipchamp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Disney.37853FC22B2CE*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'SpotifyAB.SpotifyMusic*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.549981C3F5F10*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'microsoft.windowscommunicationsapps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MSPaint*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Getstarted*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.ZuneVideo*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftCorporationII.MicrosoftFamily*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MixedReality.Portal*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.DevHome*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingWeather*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingNews*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingSearch*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.OutlookForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.GetHelp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Microsoft3DViewer*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftOfficeHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftSolitaireCollection*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftStickyNotes*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Office.OneNote*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.People*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.PowerAutomateDesktop*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.ScreenSketch*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.SkypeApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Todos*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsAlarms*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsCamera*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsFeedbackHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsMaps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsSoundRecorder*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Ink.Handwriting.Main.Store.en-US1.0' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -eq 'Microsoft.YourPhone' } | Remove-AppxProvisionedPackage -Online

    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.Client.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.Search*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=465; Cat="Confidentialite"; LabelFR="Components"; LabelEN="Components"; Risk="moderate"; Action={
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy' -Name 'VerifiedAndReputablePolicyState' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdge_8wekyb3d8bbwe' | Remove-AppxPackage -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    Start-Process -FilePath 'ONED.cmd' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\OfflineSys\ControlSet001\Services\WdBoot' -Recurse -Force -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=466; Cat="Services"; LabelFR="Services and Drivers"; LabelEN="Services and Drivers"; Risk="moderate"; Action={
    Stop-Service -Name 'OneSyncSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'OneSyncSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TrkWks' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TrkWks' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PcaSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagnosticshub.standardcollector.service' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagnosticshub.standardcollector.service' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WerSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wercplsupport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wercplsupport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UCPD' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UCPD' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'GpuEnergyDrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GpuEnergyDrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetBT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetBT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Telemetry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Telemetry' -StartupType Disabled -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=467; Cat="Confidentialite"; LabelFR="Initial Configuration"; LabelEN="Initial Configuration"; Risk="moderate"; Action={
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Enable-Feature /FeatureName:"DirectPlay" /NoRestart /All' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Remove-Capability /CapabilityName:"App.StepsRecorder~~~~0.0.1.0" /NoRestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /StartComponentCleanup' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    .\SOFTWARE.ps1
    .\SOFTWARE.ps1 -Toolbox
    .\SOFTWARE.ps1 -Brave
    .\SOFTWARE.ps1 -Firefox
    .\LIBREWOLF.ps1
    .\SOFTWARE.ps1 -Chrome
}}
$Options += [PSCustomObject]@{Id=468; Cat="Extreme"; LabelFR="Z-LAG Ultimate Process & RAM Reduction Engine v3.0"; LabelEN="Z-LAG Ultimate Process & RAM Reduction Engine v3.0"; Risk="moderate"; Action={
    $SystemControlPath = "HKLM:\SYSTEM\CurrentControlSet\Control"
    Set-ItemProperty -Path $SystemControlPath -Name "SvcHostSplitThresholdInKB" -Value 380000000 -Type DWord -Force
    $VisualPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
    if (-not (Test-Path $VisualPath)) { New-Item -Path $VisualPath -Force | Out-Null }
    Set-ItemProperty -Path $VisualPath -Name "VisualFXSetting" -Value 2 -Type DWord -Force
    $DwmPath = "HKCU:\Software\Microsoft\Windows\DWM"
    Set-ItemProperty -Path $DwmPath -Name "ColorPrevalence" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $DwmPath -Name "EnableAeroPeek" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $DwmPath -Name "AlwaysHibernateThumbnails" -Value 1 -Type DWord -Force
    $DesktopPath = "HKCU:\Control Panel\Desktop\WindowMetrics"
    Set-ItemProperty -Path $DesktopPath -Name "MinAnimate" -Value "0" -Type String -Force
    $RegMemoryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
    Set-ItemProperty -Path $RegMemoryPath -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path $RegMemoryPath -Name "LargeSystemCache" -Value 0 -Type DWord -Force
    $PrivacyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
    if (-not (Test-Path $PrivacyPath)) { New-Item -Path $PrivacyPath -Force | Out-Null }
    Set-ItemProperty -Path $PrivacyPath -Name "LetAppsRunInBackground" -Value 2 -Type DWord -Force
    $WscNotifPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection"
    if (-not (Test-Path $WscNotifPath)) { New-Item -Path $WscNotifPath -Force | Out-Null }
    Set-ItemProperty -Path $WscNotifPath -Name "ShowAlertWindow" -Value 0 -Type DWord -Force
    $BenignNotifPath = "HKLM:\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications"
    if (-not (Test-Path $BenignNotifPath)) { New-Item -Path $BenignNotifPath -Force | Out-Null }
    Set-ItemProperty -Path $BenignNotifPath -Name "DisableNotifications" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path $BenignNotifPath -Name "DisableEnhancedNotifications" -Value 1 -Type DWord -Force
    $WpnPolicies = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
    if (-not (Test-Path $WpnPolicies)) { New-Item -Path $WpnPolicies -Force | Out-Null }
    Set-ItemProperty -Path $WpnPolicies -Name "NoToastNotification" -Value 1 -Type DWord -Force
    $WpnPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications"
    if (-not (Test-Path $WpnPath)) { New-Item -Path $WpnPath -Force | Out-Null }
    Set-ItemProperty -Path $WpnPath -Name "ToastEnabled" -Value 0 -Type DWord -Force
    $PolicyExplPath = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
    if (-not (Test-Path $PolicyExplPath)) { New-Item -Path $PolicyExplPath -Force | Out-Null }
    Set-ItemProperty -Path $PolicyExplPath -Name "NoNotificationBalloon" -Value 1 -Type DWord -Force
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "SecurityHealth" -ErrorAction SilentlyContinue
    $ServicesToKill = @("DiagTrack","dmwappushservice","WerSvc","PcaSvc","SysMain","WSearch","WbioSrvc","MapsBroker","Fax","XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc","RetailDemo","RemoteRegistry","UsoSvc","BDESVC","CDPSvc","PhoneSvc","TrkWks","TabletInputService","StiSvc","wisvc","SensorDataService","SensorService","SensrSvc","BcastDVRUserService","OneSyncSvc","UserDataSvc","UnistoreSvc","PimIndexMaintenanceSvc","MessagingService","wlidsvc","wuauserv","WaaSMedicSvc","FontCache","FontCache3.0.0.0","smphost","DeviceAssociationService","WebManagementService","SDRSVC","WpcMonSvc","Spooler","PrintNotify","Themes","DPS","WdiServiceHost","WdiSystemHost","TroubleshootingSvc","TrainedDeployments","PushToInstall","LicenseManager")
    foreach ($Svc in $ServicesToKill) {
        if (Get-Service -Name $Svc -ErrorAction SilentlyContinue) {
            Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
            Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
        }
    }
    $GhostProcesses = @("OneDrive","MicrosoftEdgeUpdate","msedge","Teams","WidgetService","SearchHost","YourPhone","SkypeBackgroundHost","SecurityHealthSystray","GameBarPresenceWriter","Cortana","mobsync","ctfmon")
    foreach ($Proc in $GhostProcesses) { Stop-Process -Name $Proc -Force -ErrorAction SilentlyContinue }
    if ((Get-CimInstance Win32_OperatingSystem).Caption -like "*Windows 11*") {
        Get-AppxPackage -AllUsers *WebExperience* | Remove-AppxPackage -ErrorAction SilentlyContinue
    }
    $TelemetryTasks = @("\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser","\Microsoft\Windows\Application Experience\ProgramDataUpdater","\Microsoft\Windows\Autochk\Proxy","\Microsoft\Windows\Customer Experience Improvement Program\Consolidator","\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip","\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector","\Microsoft\Windows\Maintenance\Scheduler")
    foreach ($Task in $TelemetryTasks) {
        Disable-ScheduledTask -TaskPath (Split-Path $Task) -TaskName (Split-Path $Task -Leaf) -ErrorAction SilentlyContinue
    }
    $GpuControllers = Get-CimInstance Win32_VideoController
    foreach ($Gpu in $GpuControllers) {
        $DevicePNP = $Gpu.PNPDeviceID
        $MsiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$DevicePNP\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
        if (-not (Test-Path $MsiPath)) { New-Item -Path $MsiPath -Force | Out-Null }
        Set-ItemProperty -Path $MsiPath -Name "MSISupported" -Value 1 -Type DWord -Force
        Set-ItemProperty -Path $MsiPath -Name "MessageNumberLimit" -Value 1 -Type DWord -Force
    }
    $UltimateProfileGuid = "e9a42b02-581c-44d4-9f1f-9c732444b192"
    & powercfg /duplicateid $UltimateProfileGuid 2>$null
    & powercfg /setactive $UltimateProfileGuid 2>$null
    $PowerControlPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
    if (-not (Test-Path $PowerControlPath)) { New-Item -Path $PowerControlPath -Force | Out-Null }
    Set-ItemProperty -Path $PowerControlPath -Name "PowerThrottlingOff" -Value 1 -Type DWord -Force
}}
$Options += [PSCustomObject]@{Id=469; Cat="Confidentialite"; LabelFR="UserPreferencesMask (bundle performance)"; LabelEN="UserPreferencesMask (performance bundle)"; Risk="safe"; Action={
    $val = [byte[]](144,18,3,128,16,0,0,0); Set-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -Value $val -Type Binary -Force
}}

$Options += [PSCustomObject]@{Id=470; Cat="Processus"; LabelFR="Universal Windows 11 Optimisations (Process & RAM Floor)"; LabelEN="Universal Windows 11 Optimisations (Process & RAM Floor)"; Risk="moderate"; Action={
    Get-AppxPackage -AllUsers *WebExperience* | Remove-AppxPackage -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=471; Cat="Processus"; LabelFR="Scheduled Task Purge (Kill Hidden Processes)"; LabelEN="Scheduled Task Purge (Kill Hidden Processes)"; Risk="moderate"; Action={
    .\purge_telemetry_tasks.ps1
}}

$Options += [PSCustomObject]@{Id=472; Cat="Nettoyage"; LabelFR="Deep system clean (temp files, event logs, OneDrive)"; LabelEN="Deep system clean (temp files, event logs, OneDrive)"; Risk="moderate"; Action={
    taskkill /IM OneDrive /F 2>$null
    taskkill /IM Cortana /F 2>$null
    taskkill /IM SearchUI /F 2>$null
    taskkill /IM GameBar /F 2>$null
    taskkill /IM XboxApp /F 2>$null
    taskkill /IM YourPhone /F 2>$null
    if (Test-Path "$env:SystemRoot\SysWOW64\OneDriveSetup.exe") { Start-Process -FilePath "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" -ArgumentList "/uninstall" -Wait -ErrorAction SilentlyContinue }
    if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process -FilePath "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -Wait -ErrorAction SilentlyContinue }
    Remove-Item -Recurse -Force "$env:USERPROFILE\OneDrive" -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    dism /online /cleanup-image /startcomponentcleanup /quiet
    $logs = wevtutil el
foreach ($log in $logs) {
  wevtutil cl "$log" 2>$null
}

    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=473; Cat="Nettoyage"; LabelFR="Clean Start Menu (Only App List - No Pinned Apps or Groups)"; LabelEN="Clean Start Menu (Only App List - No Pinned Apps or Groups)"; Risk="moderate"; Action={
    startmenu.cmd
    Remove-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\StartMenuExperienceHost.settings" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\Settings\settings.dat" -Force -ErrorAction SilentlyContinue
    taskkill /IM explorer /F 2>$null
    start explorer.exe
}}

$Options += [PSCustomObject]@{Id=474; Cat="Services"; LabelFR="Services"; LabelEN="Services"; Risk="moderate"; Action={
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'dmwappushservice' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'dmwappushservice' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagnosticshub.standardcollector.service' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagnosticshub.standardcollector.service' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdiServiceHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdiServiceHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdiSystemHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdiSystemHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WerSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wercplsupport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wercplsupport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PcaSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Telemetry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Telemetry' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'pla' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'pla' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wmiApSrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wmiApSrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Wecsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Wecsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DPS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DPS' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TroubleshootingSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TroubleshootingSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'OneSyncSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'OneSyncSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpnService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpnService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpnUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpnUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DataUsageSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DataUsageSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Dssvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Dssvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DsSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DsSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CloudIdSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CloudIdSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CloudBackupRestoreSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CloudBackupRestoreSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cbdhsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cbdhsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XblAuthManager' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XblAuthManager' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XblGameSave' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XblGameSave' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XboxGipSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XboxGipSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XboxNetApiSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XboxNetApiSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BcastDVRUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BcastDVRUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WSearch' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WSearch' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SysMain' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SysMain' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Themes' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Themes' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'TrkWks' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TrkWks' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WMPNetworkSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WMPNetworkSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VacSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VacSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UserDataSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UserDataSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UnistoreSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UnistoreSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PimIndexMaintenanceSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PimIndexMaintenanceSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'spectrum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'spectrum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SpatialGraphFilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SpatialGraphFilter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SharedRealitySvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SharedRealitySvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SharedAccess' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SharedAccess' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmAgent' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmAgent' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'perceptionsimulation' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'perceptionsimulation' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MixedRealityOpenXRSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MixedRealityOpenXRSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SensrSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SensrSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SensorService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SensorService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SensorDataService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SensorDataService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'svsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'svsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'embeddedmode' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'embeddedmode' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WPDBusEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WPDBusEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wisvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wisvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpcMonSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpcMonSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MapsBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MapsBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RetailDemo' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RetailDemo' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SessionEnv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SessionEnv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TermService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TermService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UmRdpService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UmRdpService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'LicenseManager' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LicenseManager' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'AutoTimeUpdater' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AutoTimeUpdater' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tzautoupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tzautoupdate' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'W32Time' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'W32Time' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'autotimesvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'autotimesvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MessagingService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MessagingService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Semgrsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Semgrsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WarpJITSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WarpJITSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'McpManagementService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'McpManagementService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Spooler' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Spooler' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'printworkflowusersvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'printworkflowusersvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'stisvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'stisvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PrintNotify' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PrintNotify' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'usbprint' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'usbprint' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PrintScanBrokerService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PrintScanBrokerService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PrintDeviceConfigurationService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PrintDeviceConfigurationService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'LPTEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LPTEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Parallel' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Parallel' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BluetoothUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BluetoothUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthAvctpSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthAvctpSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthHFEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthHFEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthLEEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthLEEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthA2dp' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthA2dp' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHMODEM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHMODEM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Microsoft_Bluetooth_AvrcpTransport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Microsoft_Bluetooth_AvrcpTransport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RFCOMM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RFCOMM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'bthserv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bthserv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTAGService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTAGService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BluetoothAudioSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BluetoothAudioSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthMini' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthMini' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthRadUsb' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthRadUsb' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Microsoft_Bluetooth_AvctpTransport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Microsoft_Bluetooth_AvctpTransport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SSDPSRV' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SSDPSRV' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SmsRouter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SmsRouter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'IpxlatCfgSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'IpxlatCfgSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetTcpPortSharing' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetTcpPortSharing' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'KtmRm' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'KtmRm' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MSDTC' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MSDTC' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RmSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RmSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'LanmanWorkstation' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LanmanWorkstation' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'LanmanServer' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LanmanServer' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'lmhosts' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lmhosts' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NdisWan' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NdisWan' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'PhoneSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PhoneSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TapiSrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TapiSrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'lfsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lfsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SCardSvr' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SCardSvr' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ScDeviceEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ScDeviceEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SCPolicySvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SCPolicySvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'scfilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'scfilter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SEMgrSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SEMgrSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AppVClient' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AppVClient' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AJRouter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AJRouter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AppIDSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AppIDSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'DsmSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DsmSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DialogBlockingService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DialogBlockingService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MsKeyboardFilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MsKeyboardFilter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'icssvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'icssvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ShellHWDetection' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ShellHWDetection' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'defragsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'defragsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'FontCache' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'FontCache' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'MSiSCSI' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MSiSCSI' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PenService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PenService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'P9RdrService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'P9RdrService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PNRPsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PNRPsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'p2psvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'p2psvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'p2pimsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'p2pimsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PeerDistSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PeerDistSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RasAuto' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RasAuto' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RasAcd' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RasAcd' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'terminpt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'terminpt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TsUsbGD' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TsUsbGD' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VSS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VSS' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WaaSMedicSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WaaSMedicSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WalletService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WalletService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wbengine' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wbengine' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WbioSrvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WbioSrvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WEPHOSTSVC' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WEPHOSTSVC' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wdiservicehost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wdiservicehost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wdisystemhost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wdisystemhost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DisplayEnhancementService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DisplayEnhancementService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VaultSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VaultSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'EventSystem' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'EventSystem' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'GraphicsPerfSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GraphicsPerfSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NVDisplay.ContainerLocalSystem' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NVDisplay.ContainerLocalSystem' -StartupType Automatic -ErrorAction SilentlyContinue
    Stop-Service -Name 'AxInstSV' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AxInstSV' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AarSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AarSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cloudidsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cloudidsvc' -StartupType Disabled -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=475; Cat="Services"; LabelFR="Services"; LabelEN="Services"; Risk="moderate"; Action={
    Stop-Service -Name 'dam' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'dam' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'GpuEnergyDrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GpuEnergyDrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetBT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetBT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Telemetry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Telemetry' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagnosticshub.standardcollector.service' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagnosticshub.standardcollector.service' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WerSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wisvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wisvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PcaSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdiServiceHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdiServiceHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdiSystemHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdiSystemHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tcpipreg' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tcpipreg' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'edgeupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdate' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'Wecsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Wecsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UCPD' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UCPD' -StartupType Disabled -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskPath '\Microsoft\Windows\AppxDeploymentClient' -TaskName 'UCPD velocity'
    Stop-Service -Name 'condrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'condrv' -StartupType Automatic -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=476; Cat="Services"; LabelFR="Disable Unnecessary Scheduled Tasks"; LabelEN="Disable Unnecessary Scheduled Tasks"; Risk="moderate"; Action={
    Disable-ScheduledTask -TaskName '.NET Framework NGEN v4.0.30319 64 Critical' -TaskPath '\Microsoft\Windows\.NET Framework\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName '.NET Framework NGEN v4.0.30319 64' -TaskPath '\Microsoft\Windows\.NET Framework\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName '.NET Framework NGEN v4.0.30319 Critical' -TaskPath '\Microsoft\Windows\.NET Framework\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName '.NET Framework NGEN v4.0.30319' -TaskPath '\Microsoft\Windows\.NET Framework\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'StartupAppTask' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Proxy' -TaskPath '\Microsoft\Windows\Autochk\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'BgTaskRegistrationMaintenanceTask' -TaskPath '\Microsoft\Windows\BrokerInfrastructure\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Scheduled' -TaskPath '\Microsoft\Windows\Diagnosis\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'SilentCleanup' -TaskPath '\Microsoft\Windows\DiskCleanup\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'StorageSense' -TaskPath '\Microsoft\Windows\DiskFootprint\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Synchronize Language Settings' -TaskPath '\Microsoft\Windows\International\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'SvcRestartTaskLogon' -TaskPath '\Microsoft\Windows\SoftwareProtectionPlatform\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ForceSynchronizeTime' -TaskPath '\Microsoft\Windows\Time Synchronization\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'SynchronizeTime' -TaskPath '\Microsoft\Windows\Time Synchronization\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'UPnPHostConfig' -TaskPath '\Microsoft\Windows\UPnP\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'BfeOnServiceStartTypeChange' -TaskPath '\Microsoft\Windows\Windows Filtering Platform\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'AikCertEnrollTask' -TaskPath '\Microsoft\Windows\CertificateServicesClient\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'KeyPreGenTask' -TaskPath '\Microsoft\Windows\CertificateServicesClient\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'License Validation' -TaskPath '\Microsoft\Windows\Clip\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ScheduledDefrag' -TaskPath '\Microsoft\Windows\Defrag\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Metadata Refresh' -TaskPath '\Microsoft\Windows\Device Setup\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Microsoft-Windows-DiskDiagnosticDataCollector' -TaskPath '\Microsoft\Windows\DiskDiagnostic\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Microsoft-Windows-DiskDiagnosticResolver' -TaskPath '\Microsoft\Windows\DiskDiagnostic\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Diagnostics' -TaskPath '\Microsoft\Windows\DiskFootprint\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ScanForUpdates' -TaskPath '\Microsoft\Windows\InstallService\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ScanForUpdatesAsUser' -TaskPath '\Microsoft\Windows\InstallService\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'SmartRetry' -TaskPath '\Microsoft\Windows\InstallService\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'RegIdleBackup' -TaskPath '\Microsoft\Windows\Registry\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'IntelligentPwdlessTask' -TaskPath '\Microsoft\Windows\Security\Pwdless\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'SvcRestartTaskNetwork' -TaskPath '\Microsoft\Windows\SoftwareProtectionPlatform\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'MaintenanceTasks' -TaskPath '\Microsoft\Windows\StateRepository\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'EnableLicenseAcquisition' -TaskPath '\Microsoft\Windows\Subscription\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'LicenseAcquisition' -TaskPath '\Microsoft\Windows\Subscription\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ResPriStaticDbSync' -TaskPath '\Microsoft\Windows\Sysmain\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WsSwapAssessmentTask' -TaskPath '\Microsoft\Windows\Sysmain\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ResolutionHost' -TaskPath '\Microsoft\Windows\WDI\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'QueueReporting' -TaskPath '\Microsoft\Windows\Windows Error Reporting\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'CacheTask' -TaskPath '\Microsoft\Windows\Wininet\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'TaskScheduler' -TaskPath '\Microsoft\Windows\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WaaSMedic' -TaskPath '\Microsoft\Windows\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WindowsUpdate' -TaskPath '\Microsoft\Windows\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Scheduled Start' -TaskPath '\Microsoft\Windows\WindowsUpdate\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Report policies' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Schedule Scan' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Schedule Scan Static Task' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'USO_UxBroker' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Schedule Wake To Work' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Start Oobe Expedite Work' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'SR' -TaskPath '\Microsoft\Windows\SystemRestore\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'appuriverifierdaily' -TaskPath '\Microsoft\Windows\ApplicationData\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Microsoft Compatibility Appraiser' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'MareBackup' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Consolidator' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'UsbCeip' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Device User' -TaskPath '\Microsoft\Windows\Device Information\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Device' -TaskPath '\Microsoft\Windows\Device Information\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'DmClient' -TaskPath '\Microsoft\Windows\Feedback\Siuf\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'DmClientOnScenarioDownload' -TaskPath '\Microsoft\Windows\Feedback\Siuf\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ReconcileFeatures' -TaskPath '\Microsoft\Windows\Flighting\FeatureConfig\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'UsageDataFlushing' -TaskPath '\Microsoft\Windows\Flighting\FeatureConfig\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'UsageDataReporting' -TaskPath '\Microsoft\Windows\Flighting\FeatureConfig\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'LocalUserSyncDataAvailable' -TaskPath '\Microsoft\Windows\Input\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'MouseSyncDataAvailable' -TaskPath '\Microsoft\Windows\Input\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'PenSyncDataAvailable' -TaskPath '\Microsoft\Windows\Input\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'TouchpadSyncDataAvailable' -TaskPath '\Microsoft\Windows\Input\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Notifications' -TaskPath '\Microsoft\Windows\Location\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WindowsActionDialog' -TaskPath '\Microsoft\Windows\Location\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'DsSvcCleanup' -TaskPath '\Microsoft\Windows\ApplicationData\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'CreateObjectTask' -TaskPath '\Microsoft\Windows\CloudExperienceHost\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WinSAT' -TaskPath '\Microsoft\Windows\Maintenance\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Sqm-Tasks' -TaskPath '\Microsoft\Windows\PI\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'AnalyzeSystem' -TaskPath '\Microsoft\Windows\Power Efficiency Diagnostics\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'IndexerAutomaticMaintenance' -TaskPath '\Microsoft\Windows\Shell\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'MapsToastTask' -TaskPath '\Microsoft\Windows\Maps\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'MapsUpdateTask' -TaskPath '\Microsoft\Windows\Maps\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ProcessMemoryDiagnosticEvents' -TaskPath '\Microsoft\Windows\MemoryDiagnostic\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'RunFullMemoryDiagnostic' -TaskPath '\Microsoft\Windows\MemoryDiagnostic\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'TaskScheduler' -TaskPath '\Microsoft\Windows\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WaaSMedic' -TaskPath '\Microsoft\Windows\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WindowsUpdate' -TaskPath '\Microsoft\Windows\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Scheduled Start' -TaskPath '\Microsoft\Windows\WindowsUpdate\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Schedule Scan' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Schedule Scan Static Task' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Schedule Wake To Work' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Start Oobe Expedite Work' -TaskPath '\Microsoft\Windows\UpdateOrchestrator\' -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=477; Cat="Services"; LabelFR="services.yml"; LabelEN="services.yml"; Risk="moderate"; Action={
    Stop-Service -Name 'diagnosticshub.standardcollector.service' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagnosticshub.standardcollector.service' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'dmwappushservice' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'dmwappushservice' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'lfsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lfsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MapsBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MapsBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MessagingService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MessagingService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'OneSyncSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'OneSyncSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RetailDemo' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RetailDemo' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SessionEnv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SessionEnv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TermService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TermService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Themes' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Themes' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TroubleshootingSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TroubleshootingSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UmRdpService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UmRdpService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wercplsupport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wercplsupport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WerSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PcaSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wisvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wisvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WSearch' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WSearch' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VacSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VacSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UserDataSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UserDataSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UnistoreSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UnistoreSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'spectrum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'spectrum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SpatialGraphFilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SpatialGraphFilter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SharedRealitySvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SharedRealitySvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SharedAccess' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SharedAccess' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'sfloppy' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'sfloppy' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PimIndexMaintenanceSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PimIndexMaintenanceSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'perceptionsimulation' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'perceptionsimulation' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MixedRealityOpenXRSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MixedRealityOpenXRSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MicrosoftEdgeElevationService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MicrosoftEdgeElevationService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'FontCache3.0.0.0' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'FontCache3.0.0.0' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'flpydisk' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'flpydisk' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Filetrace' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Filetrace' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'fdc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'fdc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'edgeupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdate' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'edgeupdatem' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdatem' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'e1i68x64' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'e1i68x64' -StartupType Disabled -ErrorAction SilentlyContinue
    xcopy  "PostInstall" "C:\PostInstall" /E /I /H /Y
    Start-Process -FilePath 'defaultservices.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'filters.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Stop-Service -Name 'AppVClient' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AppVClient' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AJRouter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AJRouter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AppIDSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AppIDSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DsmSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DsmSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DialogBlockingService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DialogBlockingService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'autotimesvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'autotimesvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'W32Time' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'W32Time' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DPS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DPS' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DsSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DsSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DusmSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DusmSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MsKeyboardFilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MsKeyboardFilter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'icssvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'icssvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ShellHWDetection' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ShellHWDetection' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SysMain' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SysMain' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TrkWks' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TrkWks' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tzautoupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tzautoupdate' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdiSystemHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdiSystemHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdiServiceHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdiServiceHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SensorDataService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SensorDataService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SensrSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SensrSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SensorService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SensorService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Beep' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Beep' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cdfs' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cdfs' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cdrom' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cdrom' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'acpiex' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'acpiex' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cnghwassist' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cnghwassist' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Telemetry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Telemetry' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VerifierExt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VerifierExt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'udfs' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'udfs' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MsLldp' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MsLldp' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'lltdio' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lltdio' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NDU' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NDU' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'fvevol' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'fvevol' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UsoSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UsoSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cbdhsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cbdhsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BcastDVRUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BcastDVRUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'rdyboost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'rdyboost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'rdpbus' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'rdpbus' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'umbus' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'umbus' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vdrvroot' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vdrvroot' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Vid' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Vid' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CompositeBus' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CompositeBus' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'rspndr' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'rspndr' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NdisCap' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NdisCap' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetBIOS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetBIOS' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetBT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetBT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'spaceport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'spaceport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VaultSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VaultSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'EventSystem' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'EventSystem' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'storqosflt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'storqosflt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'bowser' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bowser' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WarpJITSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WarpJITSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Wecsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Wecsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'GraphicsPerfSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GraphicsPerfSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WMPNetworkSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WMPNetworkSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name '3ware' -Force -ErrorAction SilentlyContinue; Set-Service -Name '3ware' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'arcsas' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'arcsas' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'buttonconverter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'buttonconverter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'circlass' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'circlass' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Dfsc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Dfsc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ErrDev' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ErrDev' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'mrxsmb' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'mrxsmb' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'mrxsmb20' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'mrxsmb20' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PEAUTH' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PEAUTH' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'QWAVEdrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'QWAVEdrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'srv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'srv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SiSRaid2' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SiSRaid2' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SiSRaid4' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SiSRaid4' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Tcpip6' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Tcpip6' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tcpipreg' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tcpipreg' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vsmraid' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vsmraid' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VSTXRAID' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VSTXRAID' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wcnfs' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wcnfs' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WindowsTrustedRTProxy' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WindowsTrustedRTProxy' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SSDPSRV' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SSDPSRV' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SmsRouter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SmsRouter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CldFlt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CldFlt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DisplayEnhancementService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DisplayEnhancementService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'IpxlatCfgSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'IpxlatCfgSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetTcpPortSharing' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetTcpPortSharing' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'KtmRm' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'KtmRm' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'LanmanWorkstation' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LanmanWorkstation' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'LanmanServer' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LanmanServer' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'lmhosts' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lmhosts' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MSDTC' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MSDTC' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'QWAVE' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'QWAVE' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RmSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RmSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmickvpexchange' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmickvpexchange' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicguestinterface' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicguestinterface' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicshutdown' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicshutdown' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicheartbeat' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicheartbeat' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicvmsession' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicvmsession' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vpci' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vpci' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TsUsbFlt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TsUsbFlt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tsusbhub' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tsusbhub' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'storflt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'storflt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RDPDR' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RDPDR' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RdpVideominiport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RdpVideominiport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'bttflt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bttflt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicrdv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicrdv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmictimesync' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmictimesync' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicvss' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicvss' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hyperkbd' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hyperkbd' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hypervideo' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hypervideo' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'gencounter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'gencounter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmgid' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmgid' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hvservice' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hvservice' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hvcrash' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hvcrash' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'HvHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'HvHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AxInstSV' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AxInstSV' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AarSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AarSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cloudidsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cloudidsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'defragsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'defragsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ehstorclass' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ehstorclass' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ehstortcgdrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ehstortcgdrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'embeddedmode' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'embeddedmode' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'FontCache' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'FontCache' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MSiSCSI' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MSiSCSI' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Ndu' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Ndu' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'printworkflowusersvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'printworkflowusersvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PenService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PenService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'P9RdrService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'P9RdrService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PNRPsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PNRPsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'p2psvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'p2psvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'p2pimsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'p2pimsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PhoneSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PhoneSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PeerDistSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PeerDistSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RasAuto' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RasAuto' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RasAcd' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RasAcd' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SCardSvr' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SCardSvr' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ScDeviceEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ScDeviceEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SCPolicySvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SCPolicySvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'scfilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'scfilter' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SEMgrSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SEMgrSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TapiSrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TapiSrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'terminpt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'terminpt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TsUsbGD' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TsUsbGD' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VSS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VSS' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WaaSMedicSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WaaSMedicSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WalletService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WalletService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wbengine' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wbengine' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpnService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpnService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WbioSrvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WbioSrvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WEPHOSTSVC' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WEPHOSTSVC' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WPDBusEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WPDBusEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wdiservicehost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wdiservicehost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wdisystemhost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wdisystemhost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpcMonSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpcMonSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Spooler' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Spooler' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthA4dp' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthA4dp' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthHFEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthHFEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthLEEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthLEEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHMODEM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHMODEM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Microsoft_Bluetooth_AvrcpTransport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Microsoft_Bluetooth_AvrcpTransport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BluetoothUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BluetoothUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthAvctpSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthAvctpSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RFCOMM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RFCOMM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'bthserv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bthserv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTAGService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTAGService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHUSB' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHUSB' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHPORT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHPORT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthMini' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthMini' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'HidBth' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'HidBth' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SstpSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SstpSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'IKEEXT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'IKEEXT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'iphlpsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'iphlpsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NdisVirtualBus' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NdisVirtualBus' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RasMan' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RasMan' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WinHttpAutoProxySvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WinHttpAutoProxySvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'acpipagr' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'acpipagr' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'GpuEnergyDrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GpuEnergyDrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AcpiPmi' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AcpiPmi' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PRM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PRM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'acpitime' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'acpitime' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'bam' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bam' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'dam' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'dam' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WmiAcpi' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WmiAcpi' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'serenum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'serenum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'sermouse' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'sermouse' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'serial' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'serial' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'luafv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'luafv' -StartupType Disabled -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DisableDefenderServices.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'sapphireosservices.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=478; Cat="Services"; LabelFR="Services"; LabelEN="Services"; Risk="moderate"; Action={
    Stop-Service -Name 'applockerfltr' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'applockerfltr' -StartupType Manual -ErrorAction SilentlyContinue
    $build = [System.Environment]::OSVersion.Version.Build
Write-Host "Applying supported Defender preferences on Windows build $build."
$mp = Get-Command Set-MpPreference -ErrorAction SilentlyContinue
if ($mp) {
    $preferences = @{
        DisableRealtimeMonitoring = $true
        DisableBehaviorMonitoring = $true
        DisableIOAVProtection = $true
        DisableScriptScanning = $true
        DisableArchiveScanning = $true
        MAPSReporting = 0
        SubmitSamplesConsent = 2
    }
    foreach ($entry in $preferences.GetEnumerator()) {
        try {
            $param = @{}
            $param[$entry.Key] = $entry.Value
            Set-MpPreference -ErrorAction Stop @param
        } catch {
            Write-Host "Skipping Defender preference $($entry.Key): $($_.Exception.Message)"
        }
    }
}
Write-Host "Applied Defender disable preferences on Windows build $build. Protected Defender services are not stopped live to avoid access-denied timeouts and shell stalls."

    $serviceNames = @(
    'WinDefend',
    'WdBoot',
    'WdFilter',
    'WdNisDrv',
    'WdNisSvc',
    'SecurityHealthService'
)
foreach ($controlSet in @('CurrentControlSet', 'ControlSet001')) {
    foreach ($serviceName in $serviceNames) {
        $path = "HKLM:\SYSTEM\$controlSet\Services\$serviceName"
        try {
            if (Test-Path -LiteralPath $path) {
                Set-ItemProperty -LiteralPath $path -Name 'Start' -Type DWord -Value 4 -ErrorAction Stop
                Write-Host "Disabled Defender service for next boot: $path"
            }
        } catch {
            Write-Host "Skipping protected Defender service $($path): $($_.Exception.Message)"
        }
    }
}
Write-Host "Defender service startup changes were attempted without failing the playbook on protected systems."

    taskkill /IM devicecensus /F 2>$null
    taskkill /IM UsoClient /F 2>$null
    taskkill /IM devicecensus /F 2>$null
    taskkill /IM MoUsoCoreWorker /F 2>$null
    taskkill /IM wuauclt /F 2>$null
    Stop-Service -Name 'UsoSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UsoSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'WaaSMedicSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WaaSMedicSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'wuauserv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wuauserv' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpcMonSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpcMonSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'UevAgentService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UevAgentService' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'UsoSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UsoSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'iphlpsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'iphlpsvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'RetailDemo' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RetailDemo' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagnosticshub.standardcollector.service' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagnosticshub.standardcollector.service' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'dmwappushservice' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'dmwappushservice' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'MapsBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MapsBroker' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetTcpPortSharing' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetTcpPortSharing' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'RemoteAccess' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RemoteAccess' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'RemoteRegistry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RemoteRegistry' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'SharedAccess' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SharedAccess' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'TrkWks' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TrkWks' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'WbioSrvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WbioSrvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'WMPNetworkSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WMPNetworkSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'BITS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BITS' -StartupType Manual -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block Services' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block SearchApp' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block SearchHost' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block StartMenuExperienceHost' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block SystemSettings' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block Explorer' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block Services' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block SearchApp' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block SearchHost' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block StartMenuExperienceHost' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block SystemSettings' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules' -Name 'Block Explorer' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=479; Cat="Services"; LabelFR="Disabling services"; LabelEN="Disabling services"; Risk="moderate"; Action={
    Stop-Service DiagTrack -Force -ErrorAction SilentlyContinue; Set-Service DiagTrack -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service dmwappushservice -Force -ErrorAction SilentlyContinue; Set-Service dmwappushservice -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WerSvc -Force -ErrorAction SilentlyContinue; Set-Service WerSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service PcaSvc -Force -ErrorAction SilentlyContinue; Set-Service PcaSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SysMain -Force -ErrorAction SilentlyContinue; Set-Service SysMain -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WSearch -Force -ErrorAction SilentlyContinue; Set-Service WSearch -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WbioSrvc -Force -ErrorAction SilentlyContinue; Set-Service WbioSrvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service MapsBroker -Force -ErrorAction SilentlyContinue; Set-Service MapsBroker -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service Fax -Force -ErrorAction SilentlyContinue; Set-Service Fax -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XblAuthManager -Force -ErrorAction SilentlyContinue; Set-Service XblAuthManager -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XblGameSave -Force -ErrorAction SilentlyContinue; Set-Service XblGameSave -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XboxNetApiSvc -Force -ErrorAction SilentlyContinue; Set-Service XboxNetApiSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service RetailDemo -Force -ErrorAction SilentlyContinue; Set-Service RetailDemo -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service RemoteRegistry -Force -ErrorAction SilentlyContinue; Set-Service RemoteRegistry -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service UsoSvc -Force -ErrorAction SilentlyContinue; Set-Service UsoSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service BDESVC -Force -ErrorAction SilentlyContinue; Set-Service BDESVC -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service iphlpsvc -Force -ErrorAction SilentlyContinue; Set-Service iphlpsvc -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service ShellHWDetection -Force -ErrorAction SilentlyContinue; Set-Service ShellHWDetection -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service CDPSvc -Force -ErrorAction SilentlyContinue; Set-Service CDPSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service PhoneSvc -Force -ErrorAction SilentlyContinue; Set-Service PhoneSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service Spooler -Force -ErrorAction SilentlyContinue; Set-Service Spooler -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service TrkWks -Force -ErrorAction SilentlyContinue; Set-Service TrkWks -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service TabletInputService -Force -ErrorAction SilentlyContinue; Set-Service TabletInputService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service StiSvc -Force -ErrorAction SilentlyContinue; Set-Service StiSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service wisvc -Force -ErrorAction SilentlyContinue; Set-Service wisvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SensorDataService -Force -ErrorAction SilentlyContinue; Set-Service SensorDataService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SensorService -Force -ErrorAction SilentlyContinue; Set-Service SensorService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SensrSvc -Force -ErrorAction SilentlyContinue; Set-Service SensrSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WpnService -Force -ErrorAction SilentlyContinue; Set-Service WpnService -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service BcastDVRUserService -Force -ErrorAction SilentlyContinue; Set-Service BcastDVRUserService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service OneSyncSvc -Force -ErrorAction SilentlyContinue; Set-Service OneSyncSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service UserDataSvc -Force -ErrorAction SilentlyContinue; Set-Service UserDataSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service UnistoreSvc -Force -ErrorAction SilentlyContinue; Set-Service UnistoreSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service PimIndexMaintenanceSvc -Force -ErrorAction SilentlyContinue; Set-Service PimIndexMaintenanceSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service MessagingService -Force -ErrorAction SilentlyContinue; Set-Service MessagingService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service wlidsvc -Force -ErrorAction SilentlyContinue; Set-Service wlidsvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Set-Service wuauserv -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WaaSMedicSvc -Force -ErrorAction SilentlyContinue; Set-Service WaaSMedicSvc -StartupType Disabled -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=480; Cat="Services"; LabelFR="Disable telemetry and compatibility scheduled tasks"; LabelEN="Disable telemetry and compatibility scheduled tasks"; Risk="moderate"; Action={
    .\disable_telemetry_tasks.ps1
}}

$Options += [PSCustomObject]@{Id=481; Cat="Services"; LabelFR="Aggressive Service Purge (Limit Push)"; LabelEN="Aggressive Service Purge (Limit Push)"; Risk="moderate"; Action={
    Stop-Service SysMain -Force -ErrorAction SilentlyContinue; Set-Service SysMain -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service DiagTrack -Force -ErrorAction SilentlyContinue; Set-Service DiagTrack -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WerSvc -Force -ErrorAction SilentlyContinue; Set-Service WerSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service RemoteRegistry -Force -ErrorAction SilentlyContinue; Set-Service RemoteRegistry -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WSearch -Force -ErrorAction SilentlyContinue; Set-Service WSearch -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WbioSrvc -Force -ErrorAction SilentlyContinue; Set-Service WbioSrvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service MapsBroker -Force -ErrorAction SilentlyContinue; Set-Service MapsBroker -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service Fax -Force -ErrorAction SilentlyContinue; Set-Service Fax -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XblAuthManager -Force -ErrorAction SilentlyContinue; Set-Service XblAuthManager -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XblGameSave -Force -ErrorAction SilentlyContinue; Set-Service XblGameSave -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XboxNetApiSvc -Force -ErrorAction SilentlyContinue; Set-Service XboxNetApiSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XboxGipSvc -Force -ErrorAction SilentlyContinue; Set-Service XboxGipSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service XblAuthManager -Force -ErrorAction SilentlyContinue; Set-Service XblAuthManager -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service RetailDemo -Force -ErrorAction SilentlyContinue; Set-Service RetailDemo -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service BDESVC -Force -ErrorAction SilentlyContinue; Set-Service BDESVC -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service CDPSvc -Force -ErrorAction SilentlyContinue; Set-Service CDPSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service PhoneSvc -Force -ErrorAction SilentlyContinue; Set-Service PhoneSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service TrkWks -Force -ErrorAction SilentlyContinue; Set-Service TrkWks -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service TabletInputService -Force -ErrorAction SilentlyContinue; Set-Service TabletInputService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service StiSvc -Force -ErrorAction SilentlyContinue; Set-Service StiSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service wisvc -Force -ErrorAction SilentlyContinue; Set-Service wisvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SensorDataService -Force -ErrorAction SilentlyContinue; Set-Service SensorDataService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SensorService -Force -ErrorAction SilentlyContinue; Set-Service SensorService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SensrSvc -Force -ErrorAction SilentlyContinue; Set-Service SensrSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service BcastDVRUserService -Force -ErrorAction SilentlyContinue; Set-Service BcastDVRUserService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service OneSyncSvc -Force -ErrorAction SilentlyContinue; Set-Service OneSyncSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service UserDataSvc -Force -ErrorAction SilentlyContinue; Set-Service UserDataSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service UnistoreSvc -Force -ErrorAction SilentlyContinue; Set-Service UnistoreSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service PimIndexMaintenanceSvc -Force -ErrorAction SilentlyContinue; Set-Service PimIndexMaintenanceSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service MessagingService -Force -ErrorAction SilentlyContinue; Set-Service MessagingService -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service wlidsvc -Force -ErrorAction SilentlyContinue; Set-Service wlidsvc -StartupType Disabled -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=482; Cat="Bloatwares"; LabelFR="Store"; LabelEN="Store"; Risk="moderate"; Action={
    Stop-Service -Name 'AppXSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AppXSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'ClipSVC' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ClipSVC' -StartupType Manual -ErrorAction SilentlyContinue
    taskkill /IM WinStore.App /F 2>$null
    taskkill /IM WinStore.App.Host /F 2>$null
    taskkill /IM WSService /F 2>$null
    taskkill /IM InstallAgent /F 2>$null
    taskkill /IM InstallAgentUserSvc /F 2>$null
    Stop-Service -Name 'InstallService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'InstallService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TokenBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TokenBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WalletService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WalletService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WSService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WSService' -StartupType Disabled -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsStore*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.StorePurchaseApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.StoreExtensions*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxIdentityProvider*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Xbox.TCUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxGameOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxGamingOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxSpeechToTextOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Xbox*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    $paths = @(
  "$env:ProgramFiles\WindowsApps\Microsoft.WindowsStore*",
  "$env:ProgramFiles\WindowsApps\Microsoft.StorePurchaseApp*",
  "$env:LOCALAPPDATA\Packages\Microsoft.WindowsStore*",
  "$env:LOCALAPPDATA\Packages\Microsoft.StorePurchaseApp*"
); foreach ($p in $paths) { Get-Item $p -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue }
    $paths = @(
  "$env:ProgramFiles\WindowsApps\Microsoft.Xbox*"
); foreach ($p in $paths) { Get-Item $p -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue }
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskName 'SmartRetry' -TaskPath '\Microsoft\Windows\InstallService\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WSRefreshBannedAppsListTask' -TaskPath '\Microsoft\Windows\WS\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WSTask' -TaskPath '\Microsoft\Windows\WS\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'WiFiTask' -TaskPath '\Microsoft\Windows\WCM\' -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=483; Cat="Bloatwares"; LabelFR="APPX"; LabelEN="APPX"; Risk="moderate"; Action={
    .\APPX-REMOVER.ps1 -Packages @(
  'Microsoft.Windows.SecureAssessmentBrowser',
  'Microsoft.Windows.PeopleExperienceHost',
  'Microsoft.WindowsCamera',
  'MicrosoftWindows.Client.WebExperience',
  'Microsoft.WidgetsPlatformRuntime',
  'Microsoft.WindowsAlarms',
  'Microsoft.WindowsMaps',
  'Microsoft.MicrosoftStickyNotes',
  'microsoft.windowscommunicationsapps',
  'Microsoft.People',
  'Microsoft.BingNews',
  'Microsoft.BingSearch',
  'Microsoft.BingWeather',
  'Microsoft.MicrosoftSolitaireCollection',
  'Microsoft.WindowsFeedbackHub',
  'Microsoft.GetHelp',
  'Microsoft.Getstarted',
  'Microsoft.Todos',
  'Microsoft.PowerAutomateDesktop',
  'Microsoft.549981C3F5F10', # Cortana
  'MicrosoftCorporationII.QuickAssist',
  'MicrosoftCorporationII.MicrosoftFamily',
  'Microsoft.ZuneMusic',
  'Microsoft.ZuneVideo',
  'Microsoft.WindowsSoundRecorder',
  'Clipchamp.Clipchamp',
  'Microsoft.Whiteboard',
  'Microsoft.MicrosoftTeamsforSurfaceHub',
  'MicrosoftCorporationII.MailforSurfaceHub',
  'Microsoft.MicrosoftPowerBIForWindows',
  'Microsoft.SkypeApp',
  'Microsoft.MicrosoftOfficeHub',
  'Microsoft.Office.Excel',
  'Microsoft.Office.PowerPoint',
  'Microsoft.Office.Word',
  'Microsoft.Office.OneNote',
  'Microsoft.OutlookForWindows',
  'SpotifyAB.SpotifyMusic',
  'OutlookPWA',
  'Microsoft.Microsoft3DViewer',
  'Microsoft.Advertising',
  'MixedReality.Portal',
  'Microsoft.MSPaint', # Paint 3D
  'Microsoft.StartExperiencesApp'
)
    .\APPX-REMOVER.ps1 -Packages 'Microsoft.Windows.Photos'
    .\APPX-REMOVER.ps1 -Packages 'Microsoft.Windows.DevHome'
    .\APPX-REMOVER.ps1 -Packages @(
  'Microsoft.Xbox',
  'Microsoft.XboxApp', # Xbox Console Companion is deprecated
  'Microsoft.GamingApp',
  'Microsoft.Edge.GameAssist'
) -ExcludePackages 'Microsoft.XboxGameCallableUI'
    New-Item -Path 'Registry::HKCR\ms-gamebar\shell\open\command' -Force -ErrorAction SilentlyContinue | Out-Null
    .\APPX-REMOVER.ps1 -Packages @(
  'Microsoft.YourPhone',
  'MicrosoftWindows.CrossDevice'
)
}}

$Options += [PSCustomObject]@{Id=484; Cat="Bloatwares"; LabelFR="Configure Deprovisioned Apps"; LabelEN="Configure Deprovisioned Apps"; Risk="moderate"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.549981C3F5F10_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.549981C3F5F10_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingNews_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingWeather_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ECApp_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GetHelp_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Getstarted_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.People_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Todos_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Apprep.ChxApp_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Photos_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.SecureAssessmentBrowser_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsAlarms_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCamera_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsMaps_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneMusic_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneVideo_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\microsoft.windowscommunicationsapps_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Advertising.Xaml_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Microsoft3DViewer_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MixedReality.Portal_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MSPaint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Paint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsNotepad_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\clipchamp.clipchamp_yxz26nhyzhsrt' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.SecHealthUI_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCalculator_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Whiteboard_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\microsoft.microsoftskydrive_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftTeamsforSurfaceHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.MailforSurfaceHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftPowerBIForWindows_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.SkypeApp_kzf8qxf38zg5c' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.OneNote_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.Excel_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.PowerPoint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.Word_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.DevHome_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.OutlookForWindows_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MSTeams_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=485; Cat="Bloatwares"; LabelFR="Appx"; LabelEN="Appx"; Risk="moderate"; Action={
    Get-AppxPackage -AllUsers -Name '*Disney*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*microsoft.microsoftedge.stable*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftEdge*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Edge*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftEdgeDevToolsClient*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Remove-Item -Path 'C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*OneDrive*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Spotify*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*SecureAssessmentBrowser*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*PeopleExperienceHost*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.Photos*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.WindowsCamera*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage MicrosoftWindows.Client.WebExperience | Remove-AppxPackage
    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.Client.WebExperience*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.WindowsAlarms*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.WindowsMaps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftStickyNotes*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
    Get-AppxPackage -AllUsers -Name '*microsoft.windowscommunicationsapps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.People*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.BingNews*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*BingSearch*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.BingWeather*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftSolitaireCollection*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.WindowsFeedbackHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.GetHelp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Getstarted*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WebExperienceHost*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Todos*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.PowerAutomateDesktop*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.549981C3F5F10*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftCorporationII.QuickAssist*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftCorporationII.MicrosoftFamily*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.ZuneMusic*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.ZuneVideo*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.WindowsSoundRecorder*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Clipchamp.Clipchamp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Whiteboard*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*microsoft.microsoftskydrive*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftTeamsforSurfaceHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftCorporationII.MailforSurfaceHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftPowerBIForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.SkypeApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MicrosoftOfficeHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Office.Excel*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Office.PowerPoint*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Office.Word*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Office.OneNote*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*OutlookForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*OutlookPWA*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Microsoft3DViewer*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Advertising*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MixedReality.Portal*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.MSPaint*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    taskkill /IM *teams* /F 2>$null
    Get-AppxPackage -AllUsers -Name '*MicrosoftTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MSTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*DevHome*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WindowsBackup*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Flipgrid*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Xbox*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.GamingApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.XboxApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.YourPhone*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.CrossDevice*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.Ai.Copilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.Client.AIX*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WindowsBackup*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Getstarted*' | Remove-AppxPackage -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=486; Cat="Bloatwares"; LabelFR="APPX"; LabelEN="APPX"; Risk="moderate"; Action={
    Stop-Process -Name msedgewebview2,Widgets,msedge,msteams,Teams,OneDrive,Cortana,SearchUI,XboxApp,XboxPcApp,YourPhone,PhoneExperienceHost,Spotify,Skype,SkypeBackgroundHost,HxOutlook,HxTsr,GameAssist -Force -ErrorAction SilentlyContinue
exit 0

    Get-AppxPackage -AllUsers -Name '*3DViewer*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Bing*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*CamoStudio*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Client.WebExperience*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Clipchamp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*CommsPhone*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Disney*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*FeedbackHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*GamingApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Getstarted*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.549981C3F5F10*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.GetHelp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Messaging*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.OneConnect*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.People*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Todos*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.WindowsAlarms*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftOfficeHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MSTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MixedReality*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*OneDrive*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*OneNote*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*OutlookForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*PowerAutomate*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*QuickAssist*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*SkypeApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Solit*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Spotify*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Sticky*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Sway*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Wallet*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Windows.DevHome*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WindowsCamera*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*windowscommunicationsapps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WindowsMaps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WindowsPhone*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*WindowsSoundRecorder*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*YourPhone*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Zune*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftFamily*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Edge.GameAssist*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    if ([System.Environment]::OSVersion.Version.Build -le 19045) {
    $pkgs = @('Whiteboard', 'PowerBI', 'Advertising', 'OutlookPWA', 'Xbox')
    foreach ($p in $pkgs) {
        Get-AppxPackage -AllUsers "*$p*" 2>$null | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online 2>$null | Where-Object DisplayName -like "*$p*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    }
}

}}

$Options += [PSCustomObject]@{Id=487; Cat="Bloatwares"; LabelFR="Removing Bloat Apps"; LabelEN="Removing Bloat Apps"; Risk="moderate"; Action={
    .\appx_remover.ps1 -Packages @(
  'Microsoft.Windows.SecureAssessmentBrowser',
  'Microsoft.Windows.PeopleExperienceHost',
  'Microsoft.WindowsCamera',
  'MicrosoftWindows.Client.WebExperience',
  'Microsoft.WidgetsPlatformRuntime',
  'Microsoft.WindowsAlarms',
  'Microsoft.WindowsMaps',
  'Microsoft.MicrosoftStickyNotes',
  'microsoft.windowscommunicationsapps',
  'Microsoft.People',
  'Microsoft.BingNews',
  'Microsoft.BingSearch',
  'Microsoft.BingWeather',
  'Microsoft.MicrosoftSolitaireCollection',
  'Microsoft.WindowsFeedbackHub',
  'Microsoft.GetHelp',
  'Microsoft.Getstarted',
  'Microsoft.Todos',
  'Microsoft.PowerAutomateDesktop',
  'Microsoft.549981C3F5F10',
  'MicrosoftCorporationII.QuickAssist',
  'MicrosoftCorporationII.MicrosoftFamily',
  'Microsoft.ZuneMusic',
  'Microsoft.ZuneVideo',
  'Microsoft.WindowsSoundRecorder',
  'Clipchamp.Clipchamp',
  'Microsoft.Whiteboard',
  'Microsoft.MicrosoftTeamsforSurfaceHub',
  'MicrosoftCorporationII.MailforSurfaceHub',
  'Microsoft.MicrosoftPowerBIForWindows',
  'Microsoft.SkypeApp',
  'Microsoft.MicrosoftOfficeHub',
  'Microsoft.Office.Excel',
  'Microsoft.Office.PowerPoint',
  'Microsoft.Office.Word',
  'Microsoft.Office.OneNote',
  'Microsoft.OutlookForWindows',
  'SpotifyAB.SpotifyMusic',
  'OutlookPWA',
  'Microsoft.Microsoft3DViewer',
  'Microsoft.Advertising',
  'MixedReality.Portal',
  'Microsoft.MSPaint',
  'Microsoft.StartExperiencesApp',
  'Microsoft.Copilot',
  'MicrosoftTeams',
  'MSTeams',
  'Disney.37853FC22B2CE',
  'Netflix',
  'Microsoft.XboxApp',
  'Microsoft.XboxGamingOverlay',
  'Microsoft.XboxIdentityProvider',
  'Microsoft.XboxSpeechToTextOverlay',
  'Microsoft.Xbox.TCUI',
  'Microsoft.XboxGameCallableUI',
  'Microsoft.GamingApp',
  'Microsoft.YourPhone',
  'MicrosoftWindows.CrossDevice',
  'Microsoft.WindowsCalculator',
  'Microsoft.Windows.Photos',
  'Microsoft.WindowsStore',
  'Microsoft.ScreenSketch',
  'Microsoft.StorePurchaseApp'
)

    .\appx_remover.ps1 -Packages "Microsoft.Windows.Photos"
    .\appx_remover.ps1 -Packages "Microsoft.Windows.DevHome"
    .\appx_remover.ps1 -Packages @("Microsoft.Xbox", "Microsoft.XboxApp", "Microsoft.GamingApp", "Microsoft.Edge.GameAssist") -ExcludePackages "Microsoft.XboxGameCallableUI"
    New-Item -Path 'Registry::HKCR\ms-gamebar\shell\open\command' -Force -ErrorAction SilentlyContinue | Out-Null
    .\appx_remover.ps1 -Packages @("Microsoft.YourPhone", "MicrosoftWindows.CrossDevice")
    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.Client.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.Search*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    $WshShell = New-Object -comObject WScript.Shell
$DesktopPath = [System.Environment]::GetFolderPath('Desktop')

$Shortcut = $WshShell.CreateShortcut($DesktopPath + '\Download NVIDIA Drivers.url')
$Shortcut.TargetPath = 'https://www.nvidia.com/Download/index.aspx'
$Shortcut.Save()

$Shortcut2 = $WshShell.CreateShortcut($DesktopPath + '\Download AMD Drivers.url')
$Shortcut2.TargetPath = 'https://www.amd.com/en/support'
$Shortcut2.Save()

$Shortcut3 = $WshShell.CreateShortcut($DesktopPath + '\Download Intel Drivers.url')
$Shortcut3.TargetPath = 'https://www.intel.com/content/www/us/en/download-center/home.html'
$Shortcut3.Save()

    .\software.ps1
    .\software.ps1 -Brave
    .\software.ps1 -OperaGX
    .\software.ps1 -Chrome
}}

$Options += [PSCustomObject]@{Id=488; Cat="Gaming"; LabelFR="Gaming"; LabelEN="Gaming"; Risk="moderate"; Action={
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set disabledynamictick yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set useplatformtick yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set tscsyncpolicy enhanced' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100; powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100; powercfg /setactive SCHEME_CURRENT
    Get-WmiObject Win32_DiskDrive | ForEach-Object {
  $disk = $_.Index;
  $partitions = "HKLM:\SYSTEM\CurrentControlSet\Services\disk\Enum";
  Get-ItemProperty $partitions -ErrorAction SilentlyContinue | ForEach-Object {
    $_.PSObject.Properties | Where-Object { $_.Value -like "*$disk*" } | ForEach-Object {
      $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}\$($_.Name.Substring($_.Name.LastIndexOf('\')+1))";
      if (Test-Path $regPath) {
        Set-ItemProperty $regPath -Name 'WriteCacheEnabled' -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
      }
    }
  }
}
    Get-NetAdapterAdvancedProperty -DisplayName "Interrupt Moderation" -ErrorAction SilentlyContinue | Set-NetAdapterAdvancedProperty -DisplayValue "Disabled" -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=489; Cat="Gaming"; LabelFR="Gaming Tweaks"; LabelEN="Gaming Tweaks"; Risk="moderate"; Action={
    Start-Process -FilePath 'powercfg' -ArgumentList '/hibernate off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    $sx = [byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xCC,0x0C,0x00,0x00,0x00,0x00,0x00,0x80,0x99,0x19,0x00,0x00,0x00,0x00,0x00,0x40,0x66,0x26,0x00,0x00,0x00,0x00,0x00,0x00,0x33,0x33,0x00,0x00,0x00,0x00,0x00)
$sy = [byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xA8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0x00,0x00,0x00,0x00,0x00)
foreach ($scope in @('Registry::HKEY_CURRENT_USER','Registry::HKEY_USERS\.DEFAULT')) {
  $mouse = """$scope\Control Panel\Mouse"""
  $desktop = """$scope\Control Panel\Desktop"""
  New-Item -Path $mouse -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $mouse -Name 'SmoothMouseXCurve' -Value $sx -Type Binary -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $mouse -Name 'SmoothMouseYCurve' -Value $sy -Type Binary -Force -ErrorAction SilentlyContinue
  Remove-ItemProperty -Path $desktop -Name 'SCRNSAVE.EXE' -Force -ErrorAction SilentlyContinue
}

    Start-Process -FilePath 'bcdedit' -ArgumentList '/set disabledynamictick yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WerSvc' -StartupType Disabled -ErrorAction SilentlyContinue
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
          $existing = Get-ItemProperty -Path $key -Name $prop -ErrorAction SilentlyContinue
          if ($existing) {
            Set-ItemProperty -Path $key -Name $prop -Value '0' -Type String -Force -ErrorAction SilentlyContinue
          }
        } catch {}
      }
    } catch {}
  }
}
$global:LASTEXITCODE = 0

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
$global:LASTEXITCODE = 0

    Start-Process -FilePath 'powercfg' -ArgumentList '-attributes 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 -ATTRIB_HIDE' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/setdcvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/setactive scheme_current' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
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
$global:LASTEXITCODE = 0

    $sys32 = Join-Path $env:windir 'System32'
$q = [char]34
foreach ($name in @('mcupdate_GenuineIntel.dll','mcupdate_AuthenticAMD.dll')) {
  $src = Join-Path $sys32 $name
  if (Test-Path $src) {
    try {
      $tkArgs = '/F ' + $q + $src + $q
      Start-Process -FilePath 'takeown.exe' -ArgumentList $tkArgs -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
      $icArgs = $q + $src + $q + ' /grant administrators:F'
      Start-Process -FilePath 'icacls.exe' -ArgumentList $icArgs -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
      $dst = $src + '.old'
      if (Test-Path $dst) { Remove-Item -Path $dst -Force -ErrorAction SilentlyContinue }
      Move-Item -Path $src -Destination $dst -Force -ErrorAction SilentlyContinue
    } catch {}
  }
}
$global:LASTEXITCODE = 0

}}

$Options += [PSCustomObject]@{Id=490; Cat="Gaming"; LabelFR="ZLAG Gaming Core Engine"; LabelEN="ZLAG Gaming Core Engine"; Risk="moderate"; Action={
    bcdedit /deletevalue useplatformclock
    bcdedit /set disabledynamictick yes
    .\final_push.ps1
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Process explorer

}}

$Options += [PSCustomObject]@{Id=491; Cat="Gaming"; LabelFR="Extreme Network Latency Reduction (Competitive Gaming)"; LabelEN="Extreme Network Latency Reduction (Competitive Gaming)"; Risk="moderate"; Action={
    .\disable_network_offload.ps1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f
    netsh int tcp set global autotuninglevel=normal
    ipconfig /flushdns
    netsh int ip reset
}}

$Options += [PSCustomObject]@{Id=492; Cat="Apps"; LabelFR="Wallpaper"; LabelEN="Wallpaper"; Risk="moderate"; Action={
    Start-Process -FilePath 'NSudoLC.exe' -ArgumentList '-U:T -P:E -M:S -Priority:RealTime -UseCurrentConsole -Wait icacls.exe "%WINDIR%\Resources\Themes\aero.theme" /reset /t' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'PowerShell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File WALLPAPER-APPLY.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=493; Cat="Apps"; LabelFR="Remove Win32 apps"; LabelEN="Remove Win32 apps"; Risk="moderate"; Action={
    taskkill /IM MicrosoftEdgeUpdate /F 2>$null
    taskkill /IM msedge /F 2>$null
    taskkill /IM MicrosoftEdge* /F 2>$null
    taskkill /IM setup /F 2>$null
    .\EDGE.ps1 -Mode EdgeBrowser
    .\APPX-REMOVER.ps1 -Packages @(
  'Microsoft.MicrosoftEdge',
  'Microsoft.MicrosoftEdgeDevToolsClient',
  'Microsoft.Edge.GameAssist'
)
    .\APPX-REMOVER.ps1 -Packages 'Microsoft.Copilot'
    taskkill /IM OneDriveStandaloneUpdater /F 2>$null
    taskkill /IM OneDriveSetup /F 2>$null
    taskkill /IM OneDrive* /F 2>$null
    Start-Process -FilePath 'ONED.cmd' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\OneDriveTemp' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%ProgramData%\Microsoft OneDrive' -Force -ErrorAction SilentlyContinue
    .\APPX-REMOVER.ps1 -Packages @(
  'OneDrive',
  'microsoft.microsoftskydrive'
)
    taskkill /IM Teams /F 2>$null
    taskkill /IM Update /F 2>$null
    taskkill /IM ms-teamsupdate /F 2>$null
    .\APPX-REMOVER.ps1 -Packages @(
  'MicrosoftTeams',
  'MSTeams', # New Teams
  'Flipgrid'
)
    Start-Process -FilePath 'msiexec.exe' -ArgumentList '/qn /norestart /X{A7AB73A3-CB10-4AA5-9D38-6AEFFBDE4C91}' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=494; Cat="Apps"; LabelFR="Optional Features"; LabelEN="Optional Features"; Risk="moderate"; Action={
    DISM-FEATURES.ps1
}}

$Options += [PSCustomObject]@{Id=495; Cat="Apps"; LabelFR="Packages"; LabelEN="Packages"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'winpackage --install system-components-removal' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks security defender disable --force' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks security defender enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'winpackage --install ai-removal' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'winpackage --install onedrive-removal' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}


$Options += [PSCustomObject]@{Id=497; Cat="Apps"; LabelFR="Software"; LabelEN="Software"; Risk="moderate"; Action={
    Start-Process -FilePath 'FIREFOX.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'LIBREWOLF.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'BRAVE.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'STARTMENU.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'NOMACSCONF.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'SOFTSHRT.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'FILEASSOC.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'VLCASSOC.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'WALLPAPER.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=498; Cat="Apps"; LabelFR="Set Z LAG wallpaper"; LabelEN="Set Z LAG wallpaper"; Risk="moderate"; Action={
    .\set_wallpaper.ps1
    .\pfp.ps1
}}

$Options += [PSCustomObject]@{Id=499; Cat="Power"; LabelFR="configure-power-control"; LabelEN="configure-power-control"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks utilities hibernation disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks utilities fast-startup disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks utilities hibernation enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks utilities fast-startup enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=500; Cat="Confidentialite"; LabelFR="Defender"; LabelEN="Defender"; Risk="moderate"; Action={
    taskkill /IM NisSrv /F 2>$null
    taskkill /IM SecurityHealthHost /F 2>$null
    taskkill /IM SecurityHealthService /F 2>$null
    taskkill /IM SecurityHealthSystray /F 2>$null
    taskkill /IM MsMpEng /F 2>$null
    taskkill /IM smartscreen /F 2>$null
    Stop-Service -Name 'WinDefend' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WinDefend' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'Sense' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Sense' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdNisSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdNisSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'SecurityHealthService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SecurityHealthService' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmBroker' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmAgent' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmAgent' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'MsSecCore' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MsSecCore' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'webthreatdefusersvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'webthreatdefusersvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'webthreatdefsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'webthreatdefsvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'MDCoreSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MDCoreSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskName 'Windows Defender Cache Maintenance' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Windows Defender Cleanup' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Windows Defender Scheduled Scan' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Windows Defender Verification' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Classes\*\ShellEx\ContextMenuHandlers\EPP' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Classes\Drive\ShellEx\ContextMenuHandlers\EPP' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Classes\Directory\ShellEx\ContextMenuHandlers\EPP' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.Apprep.ChxApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Disable-Feature /FeatureName:"Windows-Defender-Default-Definitions" /NoRestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    $paths = @(
  "$env:SystemRoot\System32\SecurityHealthSystray.exe",
  "$env:SystemRoot\System32\SecurityHealthService.exe",
  "$env:SystemRoot\System32\SecurityHealthAgent.dll",
  "$env:SystemRoot\System32\SecurityHealthHost.exe",
  "$env:SystemRoot\System32\SecurityHealthCore.dll",
  "$env:SystemRoot\System32\SecurityHealthProxyStub.dll",
  "$env:SystemRoot\System32\SecurityHealthUdk.dll",
  "$env:SystemRoot\System32\drivers\WdNisDrv.sys"
); foreach ($p in $paths) { if (Test-Path $p) { Remove-Item $p -Force -ErrorAction SilentlyContinue } }
    Stop-Service -Name 'WdFilter' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdFilter' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'WdBoot' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WdBoot' -StartupType Manual -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=501; Cat="Confidentialite"; LabelFR="Privacy"; LabelEN="Privacy"; Risk="moderate"; Action={
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Remove-Capability /CapabilityName:"App.StepsRecorder~~~~0.0.1.0" /NoRestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Remove-Package /PackageName:"Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.19041.1" /NoRestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Remove-Capability /CapabilityName:"Media.WindowsMediaPlayer~~~~0.0.12.0" /NoRestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=502; Cat="Confidentialite"; LabelFR="Configure Privacy -> Content Delivery Manager"; LabelEN="Configure Privacy -> Content Delivery Manager"; Risk="moderate"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=503; Cat="Confidentialite"; LabelFR="Privacy Hardening"; LabelEN="Privacy Hardening"; Risk="moderate"; Action={
    $caps = @('documentsLibrary','downloadsFolder','musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess','appDiagnostics','generativeAI','passkeys','userDataTasks','userAccountInformation','contacts','appointments','phoneCall','phoneCallHistory','email','chat','location','activity','humanPresence','eyeTracker','gazeInput')
foreach ($scope in @('HKLM:\\SOFTWARE','Registry::HKEY_USERS\\.DEFAULT\\Software')) {
  foreach ($cap in $caps) {
    $base = $scope + '\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\' + $cap
    try { New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $base -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
    $np = $base + '\\NonPackaged'
    try { New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $np -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
  }
}
Get-ChildItem -Path 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$' } | ForEach-Object {
  $sid = $_.PSChildName
  foreach ($cap in $caps) {
    $base = 'Registry::HKEY_USERS\\' + $sid + '\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\' + $cap
    try { New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $base -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
    $np = $base + '\\NonPackaged'
    try { New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $np -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
  }
}
$global:LASTEXITCODE = 0

    $caps = @('documentsLibrary','downloadsFolder','musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess','appDiagnostics')
$scopes = @('HKLM:\\SOFTWARE','Registry::HKEY_USERS\\.DEFAULT\\Software')
foreach ($scope in $scopes) {
  foreach ($cap in $caps) {
    $base = $scope + '\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\' + $cap
    try { New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $base -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
    try { Set-ItemProperty -Path $base -Name 'LastUsedTimeStop' -Value 0 -Type QWord -Force -ErrorAction SilentlyContinue } catch {}
    $np = $base + '\\NonPackaged'
    try { New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $np -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
  }
}
foreach ($sidKey in (Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$' })) {
  $sid = $sidKey.PSChildName
  foreach ($cap in $caps) {
    $base = 'Registry::HKEY_USERS\\' + $sid + '\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\' + $cap
    try { New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $base -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
    $np = $base + '\\NonPackaged'
    try { New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    try { Set-ItemProperty -Path $np -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue } catch {}
  }
}
$global:LASTEXITCODE = 0
exit 0

    $fsosDir = Join-Path $env:windir 'FSOS'
foreach ($f in @('fsos-options','fsos-pkgs-current')) {
  $p = Join-Path $fsosDir "$f.txt"
  if (Test-Path $p) { & cmd.exe /c del /f /q """$p""" 2>$null | Out-Null }
}
$winreAgent = Join-Path $env:SystemDrive '$WinREAgent'
if (Test-Path $winreAgent) {
  & cmd.exe /c rd /s /q """$winreAgent""" 2>$null | Out-Null
}
$global:LASTEXITCODE = 0

    Get-Process -Name 'StartMenuExperienceHost' -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
$profiles = @('C:\Users\Default')
Get-ChildItem 'C:\Users' -Directory -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Default User','Public','All Users','Default','WDAGUtilityAccount')
} | ForEach-Object { $profiles += $_.FullName }
foreach ($profile in $profiles) {
  $shellDir = Join-Path $profile 'AppData\Local\Microsoft\Windows\Shell'
  if (Test-Path $shellDir) {
    Get-ChildItem -Path $shellDir -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  }
  $smehBase = Join-Path $profile 'AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy'
  foreach ($sub in @('LocalState','TempState','LocalCache')) {
    $d = Join-Path $smehBase $sub
    if (Test-Path $d) {
      Get-ChildItem -Path $d -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    }
  }
  $iconCache = Join-Path $profile 'AppData\Local\Microsoft\Windows\Caches'
  if (Test-Path $iconCache) {
    Get-ChildItem -Path $iconCache -Force -ErrorAction SilentlyContinue -Filter '*.db' | Remove-Item -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

}}

$Options += [PSCustomObject]@{Id=504; Cat="Confidentialite"; LabelFR="Block Microsoft telemetry via hosts file"; LabelEN="Block Microsoft telemetry via hosts file"; Risk="moderate"; Action={
    .\add_telemetry_hosts.ps1
}}

$Options += [PSCustomObject]@{Id=505; Cat="Confidentialite"; LabelFR="Aggressive Windows Defender removal"; LabelEN="Aggressive Windows Defender removal"; Risk="moderate"; Action={
    Stop-Service WinDefend -Force -ErrorAction SilentlyContinue; Set-Service WinDefend -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WdNisSvc -Force -ErrorAction SilentlyContinue; Set-Service WdNisSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service SecurityHealthService -Force -ErrorAction SilentlyContinue; Set-Service SecurityHealthService -StartupType Disabled -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=506; Cat="Confidentialite"; LabelFR="Performance"; LabelEN="Performance"; Risk="moderate"; Action={
    Disable-MMAgent -mc
    Start-Process -FilePath 'powercfg' -ArgumentList '/h off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Get-NetAdapter | Set-NetAdapterAdvancedProperty -RegistryKeyword "*RSS" -RegistryValue 1 -ErrorAction SilentlyContinue
    Get-NetAdapter | Set-NetAdapterAdvancedProperty -RegistryKeyword "*NumRssQueues" -RegistryValue 2 -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global chimney=disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global dca=enabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global netdma=enabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global timestamps=disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global rss=enabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set supplemental template=Internet congestionprovider=ctcp' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set supplemental template=InternetCustom congestionprovider=ctcp' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set disabledynamictick yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/deletevalue useplatformclock' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} nx optin' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} recoveryenabled no' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} disableelamdrivers yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set bootmenupolicy Legacy' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} hypervisorlaunchtype off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=507; Cat="Confidentialite"; LabelFR="UI"; LabelEN="UI"; Risk="moderate"; Action={
    # Clear Taskband registry (pinned taskbar items)
$taskband = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband'
if (Test-Path $taskband) {
    Remove-ItemProperty -Path $taskband -Name 'Favorites' -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $taskband -Name 'FavoritesResolve' -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $taskband -Name 'QuickLaunch' -Force -ErrorAction SilentlyContinue
}
# Clear Jump List caches
$jumpListPaths = @(
    "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations"
    "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations"
    "$env:APPDATA\Microsoft\Windows\Recent\Destinations"
)
foreach ($jl in $jumpListPaths) {
    if (Test-Path $jl) { Remove-Item "$jl\*" -Force -ErrorAction SilentlyContinue }
}
# Clear recent items
$recent = "$env:APPDATA\Microsoft\Windows\Recent"
if (Test-Path $recent) { Remove-Item "$recent\*" -Force -ErrorAction SilentlyContinue }

    New-Item -Path 'Registry::HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' -Force -ErrorAction SilentlyContinue | Out-Null
    taskkill /IM explorer /F 2>$null
    Start-Process explorer.exe
    $folders = @(
  "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Accessibility",
  "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Maintenance",
  "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Windows Accessories",
  "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Windows PowerShell",
  "$env:SystemDrive\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessibility",
  "$env:SystemDrive\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories",
  "$env:SystemDrive\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Maintenance",
  "$env:SystemDrive\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell",
  "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Accessibility",
  "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Accessories",
  "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Maintenance",
  "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell"
); foreach ($f in $folders) {
  if (Test-Path $f) { Remove-Item $f -Recurse -Force -ErrorAction SilentlyContinue }
}
}}

$Options += [PSCustomObject]@{Id=508; Cat="Confidentialite"; LabelFR="Updates"; LabelEN="Updates"; Risk="moderate"; Action={
    Stop-Service -Name 'wuauserv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wuauserv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UsoSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UsoSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WaaSMedicSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WaaSMedicSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BITS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BITS' -StartupType Disabled -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskName 'Scheduled Start' -TaskPath '\Microsoft\Windows\WindowsUpdate\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'sih' -TaskPath '\Microsoft\Windows\WindowsUpdate\' -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=509; Cat="Confidentialite"; LabelFR="Final"; LabelEN="Final"; Risk="moderate"; Action={
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:WINDIR\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:WINDIR\Logs\*.log" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:WINDIR\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:WINDIR\MEMORY.DMP" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\CrashDumps\*" -Recurse -Force -ErrorAction SilentlyContinue
    $tasksToDisable = @(
        "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem",
        "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents",
        "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic",
        "\Microsoft\Windows\Windows Error Reporting\QueueReporting",
        "\Microsoft\Windows\Application Experience\AitAgent",
        "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector",
        "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
        "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
        "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
        "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask",
        "\Microsoft\Windows\WindowsUpdate\Scheduled Start",
        "\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate",
        "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work",
        "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
    )
    foreach ($t in $tasksToDisable) {
        $tn = Split-Path $t -Leaf
        $tp = Split-Path $t
        Disable-ScheduledTask -TaskName $tn -TaskPath "$tp\" -ErrorAction SilentlyContinue | Out-Null
    }
    Get-ScheduledTask | Where-Object { $_.TaskPath -match '\\Microsoft\\Windows\\Application Experience\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Autochk\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\CloudExperienceHost\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Customer Experience Improvement Program\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\DiskDiagnostic\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Feedback\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Maps\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Office\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\PI\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Power Efficiency Diagnostics\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\Windows Error Reporting\\' } | Disable-ScheduledTask -ErrorAction SilentlyContinue
    Get-ScheduledTask | Where-Object { $_.TaskPath -match '\\Microsoft\\XblGameSave\\' } | Disable-ScheduledTask -ErrorAction SilentlyContinue
    Get-ScheduledTask | Where-Object { $_.TaskPath -match '\\Microsoft\\Windows\\WindowsUpdate\\' -or $_.TaskPath -match '\\Microsoft\\Windows\\UpdateOrchestrator\\' } | Disable-ScheduledTask -ErrorAction SilentlyContinue
    setx DOTNET_CLI_TELEMETRY_OPTOUT 1
    setx POWERSHELL_TELEMETRY_OPTOUT 1
    Start-Process -FilePath 'gpupdate.exe' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Unregister-ScheduledTask -TaskName "UScheduler" -TaskPath "\Microsoft\Windows\AppxAllUserStore\" -Confirm:$false -ErrorAction SilentlyContinue
    compact.exe /CompactOS:always
    compact.exe /C /S:"C:\Windows" /I /Q /EXE:LZX
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
Start-Process explorer

}}

$Options += [PSCustomObject]@{Id=510; Cat="Confidentialite"; LabelFR="Copy PostInstall Folder"; LabelEN="Copy PostInstall Folder"; Risk="moderate"; Action={
    Start-Process -FilePath 'PowerShell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File Copy-PostInstall.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'PowerShell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File Install-AtomToolBox.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=511; Cat="Confidentialite"; LabelFR="Configuration"; LabelEN="Configuration"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance ntfs-last-access disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance ntfs-8dot3-naming disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Disable-MMAgent -mc
    setx DOTNET_CLI_TELEMETRY_OPTOUT 1
    setx POWERSHELL_TELEMETRY_OPTOUT 1
    Start-Process -FilePath 'PowerShell' -ArgumentList '-NoP -ExecutionPolicy Bypass -File CLEANER.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Get-ScheduledTask -TaskPath "\Microsoft\Office\*" | Disable-ScheduledTask
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance service-grouping set recommended' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'FINALIZE.cmd' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'STARTMENU.cmd' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'FILEASSOC.cmd' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    robocopy "Wallpapers" "%systemroot%\Web\Wallpaper\MeetRevision\v2" /E /PURGE /IM /IT /NP
    .\WALLPAPER.ps1 -Mode Desktop -ImagePath $env:systemroot\Web\Wallpaper\MeetRevision\v2\desktop.jpg
    .\WALLPAPER.ps1 -Mode LockScreen -ImagePath $env:systemroot\Web\Wallpaper\MeetRevision\v2\lockscreen.jpg
    Copy-Item -Path .\WALLPAPER.ps1 -Destination "$env:systemroot\Web\Wallpaper\MeetRevision" -Force
    Copy-Item -Path .\WallpaperStartup.cmd -Destination "$env:systemroot\Web\Wallpaper\MeetRevision" -Force
    .\\Set-Theme.ps1 -Path (Join-Path $env:SystemRoot "Resources\\Themes\\dark.theme")
    .\Set-Theme.ps1 -New @{ WallpaperPath = (Join-Path $env:SystemRoot 'Web\Wallpaper\MeetRevision\v2\desktop.jpg'); ThemeExportPath = (Join-Path $env:SystemRoot 'Resources\Themes\revi.theme'); SystemMode = 'Light'; AppMode = 'Light' }
    .\Set-Theme.ps1 -New @{ WallpaperPath = (Join-Path $env:SystemRoot 'Web\Wallpaper\MeetRevision\v2\desktop.jpg'); ThemeExportPath = (Join-Path $env:SystemRoot 'Resources\Themes\revi.theme'); SystemMode = 'Dark'; AppMode = 'Dark' }
    Get-AppxPackage -AllUsers -Name '*Client.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*StartMenuExperienceHost*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Windows.Search*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*TCUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Start-Process -FilePath 'gpupdate.exe' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks patches' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    $explorerProcess = Get-Process -Name explorer -ErrorAction SilentlyContinue
if ($explorerProcess) {
  Stop-Process -Name explorer -Force
}
Start-Process explorer

}}

$Options += [PSCustomObject]@{Id=512; Cat="Confidentialite"; LabelFR="Configure Control Panel"; LabelEN="Configure Control Panel"; Risk="moderate"; Action={
    Remove-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Name 'MaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Name 'MaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Name 'TimeToMaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Name 'TimeToMaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys' -Name 'MaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys' -Name 'MaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys' -Name 'TimeToMaximumSpeed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys' -Name 'TimeToMaximumSpeed' -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\AudioDescription' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\Blind Access' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\HighContrast' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\Keyboard Preference' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\Keyboard Response' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\MouseKeys' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\On' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\ShowSounds' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\SlateLaunch' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\SoundSentry' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\StickyKeys' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\TimeOut' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\Control Panel\Accessibility\ToggleKeys' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\AudioDescription' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\Blind Access' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\HighContrast' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\Keyboard Preference' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\Keyboard Response' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\On' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\ShowSounds' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\SlateLaunch' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\SoundSentry' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\StickyKeys' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\TimeOut' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKU\.DEFAULT\Control Panel\Accessibility\ToggleKeys' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=513; Cat="Confidentialite"; LabelFR="Configure Explorer"; LabelEN="Configure Explorer"; Risk="moderate"; Action={
    $folderTypesKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes'
$downloadsFolderID = '{885a186e-a440-4ada-812b-db871b942259}'

$path = Join-Path -Path $folderTypesKey -ChildPath $downloadsFolderID
Get-ChildItem -Path $path -Recurse | ForEach-Object {
  if ((Get-ItemProperty -Path $_.PSPath).GroupBy) {
      Set-ItemProperty -Path $_.PSPath -Name GroupBy -Value ''
    }
}

    $downloadsFolderID = '{885a186e-a440-4ada-812b-db871b942259}'
$bagsPath = 'HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags'
Get-ChildItem -Path $bagsPath | ForEach-Object {
  $fullPath = Join-Path -Path $_.PSPath -ChildPath 'Shell\{885A186E-A440-4ADA-812B-DB871B942259}'
  if (Test-Path -Path $fullPath) {
    Remove-Item -Path $fullPath -Recurse
  } 
}

    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAnimations' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAnimations' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=514; Cat="Confidentialite"; LabelFR="Configure Windows Settings"; LabelEN="Configure Windows Settings"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'registry hide-page --value "cortana,privacy-feedback,windowsinsider,home"' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'registry hide-page --value "crossdevice"' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Id' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Id' -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks personalization input-personalization disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Software\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=515; Cat="Confidentialite"; LabelFR="disable-system-restore-pre-defined-config"; LabelEN="disable-system-restore-pre-defined-config"; Risk="moderate"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=516; Cat="Confidentialite"; LabelFR="fixes"; LabelEN="fixes"; Risk="moderate"; Action={
    New-Item -Path 'Registry::HKCU\Software\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=517; Cat="Confidentialite"; LabelFR="Configure Security"; LabelEN="Configure Security"; Risk="moderate"; Action={
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=518; Cat="Confidentialite"; LabelFR="Configure Security -> Virtualization Based Security"; LabelEN="Configure Security -> Virtualization Based Security"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks security vbs disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=519; Cat="Confidentialite"; LabelFR="configure-kernel"; LabelEN="configure-kernel"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance intel-tsx enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=520; Cat="Confidentialite"; LabelFR="Configure Updates -> Drivers"; LabelEN="Configure Updates -> Drivers"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance wu-drivers disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=521; Cat="Confidentialite"; LabelFR="Configure general updates settings"; LabelEN="Configure general updates settings"; Risk="moderate"; Action={
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance wu-pause-updates enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\DevHomeUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate' -Recurse -Force -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=522; Cat="Confidentialite"; LabelFR="Rollback Tweaks"; LabelEN="Rollback Tweaks"; Risk="moderate"; Action={
    Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Security' -Name 'DisableSecuritySettingsCheck' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security' -Name 'DisableSecuritySettingsCheck' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Security' -Name 'DisableFixSecuritySettings' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security' -Name 'DisableFixSecuritySettings' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Download' -Name 'CheckExeSignatures' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name 'ClearBrowsingHistoryOnExit' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name 'ClearBrowsingHistoryOnExit' -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set supplemental internet congestionprovider=default' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name 'RegisteredOrganisation' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\Software\Classes\CLSID' -Name 'IsModernRCEnabled' -ErrorAction SilentlyContinue
    Stop-Service -Name 'bam' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bam' -StartupType Manual -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -ErrorAction SilentlyContinue
    Stop-Service -Name 'Beep' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Beep' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'GraphicsPerfSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GraphicsPerfSvc' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'Ndu' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Ndu' -StartupType Automatic -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions\ProcessMitigationOptions' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions\ProcessMitigationOptions' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management' -Name 'FeatureSettings' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management' -Name 'FeatureSettingsOverride' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management' -Name 'FeatureSettingsOverrideMask' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance' -Name 'MaintenanceDisabled' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics' -Name 'EnabledExecution' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing' -Name 'RepairContentServerSource' -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance superfetch enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction' -Name 'Enable' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout' -Name 'EnableAutoLayout' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'AllowInputPersonalization' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences' -Name 'ModelDownloadAllowed' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSyncNGSC' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Policies\Microsoft\InternetManagement' -Name 'RestrictCommunication' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\Software\Policies\Microsoft\InternetManagement' -Name 'RestrictCommunication' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot' -Name 'DisableRootAutoUpdate' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' -Name 'AllowWindowsEntitlementReactivation' -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'EnableAutoTray' -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Biometrics' -Recurse -Force -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance background-apps enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*XboxGamingOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCU\Software\Policies\Microsoft\Internet Explorer' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Internet Explorer' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Mouse' -Name 'MouseHoverTime' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'ConnectedSearchSafeSearch' -ErrorAction SilentlyContinue
    Stop-Service -Name 'DPS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DPS' -StartupType Automatic -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=523; Cat="Confidentialite"; LabelFR="Initialization"; LabelEN="Initialization"; Risk="moderate"; Action={
    robocopy "Licenses" "%SystemDrive%\Licenses" /E /PURGE /IM /IT /NP
    copy /y "hosts" "%WINDIR%\System32\drivers\etc\hosts"
    ipconfig /flushdns
    Start-Process -FilePath 'vc_redist.x64.exe' -ArgumentList '/quiet /norestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'RevisionTool-Setup.exe' -ArgumentList '/VERYSILENT /TASKS="desktopicon"' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'revitool.exe' -ArgumentList 'tweaks performance powerplan enable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'PowerShell' -ArgumentList '-NoP -ExecutionPolicy Bypass -File ngen.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}



$Options += [PSCustomObject]@{Id=525; Cat="Confidentialite"; LabelFR="Strip"; LabelEN="Strip"; Risk="moderate"; Action={
    $snapPath = Join-Path $env:TEMP 'fsos-appx-snapshot.txt'
(Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue).PackageFamilyName |
  Sort-Object -Unique | Out-File -FilePath $snapPath -Encoding ASCII -Force
$global:LASTEXITCODE = 0

    $opts = @()
$optsFile = Join-Path $env:windir 'FSOS\fsos-options.txt'
if (Test-Path $optsFile) { $opts = Get-Content $optsFile -ErrorAction SilentlyContinue }
$unpin = @('Copilot','Microsoft Copilot','Outlook','Outlook (new)','Outlook for Windows','Microsoft Outlook','Dev Home','Phone Link','Microsoft Teams','Teams')
if ($opts -contains 'remove-xbox') { $unpin += @('Xbox','Game Bar','Xbox Game Bar') }
if ($opts -contains 'remove-store') { $unpin += @('Microsoft Store') }
if ($opts -contains 'remove-edge') { $unpin += @('Microsoft Edge','Edge') }
$shell = New-Object -ComObject Shell.Application
$apps = $shell.NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}')
$apps.Items() | ForEach-Object {
  if ($unpin -contains $_.Name) {
    $_.InvokeVerb('taskbarunpin')
  }
}

    Get-AppxPackage -AllUsers -Name 'Microsoft.549981C3F5F10*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingNews*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingWeather*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingSearch*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftCorporationII.Bing*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Clipchamp.Clipchamp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.GetHelp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Getstarted*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MSPaint*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Paint*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsCalculator*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '7EE7776C.LinkedInforWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WebMediaExtensions*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.HEIFImageExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.HEVCVideoExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.RawImageExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.VP9VideoExtensions*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WebpImageExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MPEG2VideoExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.AV1VideoExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Microsoft3DViewer*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftOfficeHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftSolitaireCollection*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftStickyNotes*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Office.OneNote*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.OutlookForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.People*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.PowerAutomateDesktop*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.SkypeApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.StartExperiencesApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Todos*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Whiteboard*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WidgetsPlatformRuntime*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.PeopleExperienceHost*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.SecureAssessmentBrowser*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsAlarms*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsCamera*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsFeedbackHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsMaps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsSoundRecorder*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.ZuneMusic*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.ZuneVideo*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftCorporationII.MicrosoftFamily*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftCorporationII.QuickAssist*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.Client.WebExperience*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'SpotifyAB.SpotifyMusic*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'microsoft.windowscommunicationsapps*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.DevHome*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Advertising.Xaml*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftPowerBIForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MixedReality.Portal*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Office.Word*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Office.Excel*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Office.PowerPoint*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.OutlookPWA*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Flipgrid*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdgeDevToolsClient*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftCorporationII.MailforSurfaceHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftTeamsforSurfaceHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.Client.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    $profiles = @('C:\Users\Default')
Get-ChildItem 'C:\Users' -Directory -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Default User','Public','All Users','Default')
} | ForEach-Object { $profiles += $_.FullName }

foreach ($profile in $profiles) {
  $shellDir = Join-Path $profile 'AppData\Local\Microsoft\Windows\Shell'
  if (Test-Path $shellDir) {
    Get-ChildItem -Path $shellDir -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.549981C3F5F10_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingNews_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingWeather_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Clipchamp.Clipchamp_yxz26nhyzhsrt' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GetHelp_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Getstarted_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.OutlookForWindows_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.People_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.SkypeApp_kzf8qxf38zg5c' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Todos_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsAlarms_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsMaps_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.YourPhone_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneMusic_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneVideo_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Copilot_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.AIX_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Ai.Copilot.Provider_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxApp_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GamingApp_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxGameCallableUI_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Xbox.TCUI_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCalculator_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Paint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MSPaint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingSearch_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.DevHome_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Advertising.Xaml_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftPowerBIForWindows_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MixedReality.Portal_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.Word_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.Excel_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.PowerPoint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.OutlookPWA_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Flipgrid_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.MailforSurfaceHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftTeamsforSurfaceHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\7EE7776C.LinkedInforWindows_w1wdnht996qgy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.OneDrive_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\microsoft.microsoftskydrive_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.SkyDrive_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    taskkill /IM OneDriveStandaloneUpdater /F 2>$null
    taskkill /IM OneDriveSetup /F 2>$null
    taskkill /IM OneDrive /F 2>$null
    $dotDefault = 'Registry::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run'
try { Remove-ItemProperty -Path $dotDefault -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue } catch {}
try { Remove-ItemProperty -Path $dotDefault -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue } catch {}

if (Test-Path 'Registry::HKEY_USERS\AME_UserHive_Default') {
  $ameh = 'Registry::HKEY_USERS\AME_UserHive_Default\Software\Microsoft\Windows\CurrentVersion\Run'
  try { Remove-ItemProperty -Path $ameh -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue } catch {}
  try { Remove-ItemProperty -Path $ameh -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue } catch {}
}

Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object {
  $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
} | ForEach-Object {
  $p = 'Registry::HKEY_USERS\' + $_.PSChildName + '\Software\Microsoft\Windows\CurrentVersion\Run'
  try { Remove-ItemProperty -Path $p -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue } catch {}
  try { Remove-ItemProperty -Path $p -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue } catch {}
}

$ntu = 'C:\Users\Default\NTUSER.DAT'
if (Test-Path $ntu) {
  reg load 'HKLM\FSOS_OD' $ntu 2>$null | Out-Null
  try {
    $run = 'HKLM:\FSOS_OD\Software\Microsoft\Windows\CurrentVersion\Run'
    if (Test-Path $run) {
      Remove-ItemProperty -Path $run -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue
      Remove-ItemProperty -Path $run -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue
    }
    $runOnce = 'HKLM:\FSOS_OD\Software\Microsoft\Windows\CurrentVersion\RunOnce'
    if (Test-Path $runOnce) {
      Remove-ItemProperty -Path $runOnce -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue
      Remove-ItemProperty -Path $runOnce -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue
    }
  } catch {}
  [gc]::Collect(); Start-Sleep -Milliseconds 300
  reg unload 'HKLM\FSOS_OD' 2>$null | Out-Null
}

foreach ($exe in @(
  """$env:SystemRoot\System32\OneDriveSetup.exe""",
  """$env:SystemRoot\SysWOW64\OneDriveSetup.exe"""
)) {
  if (Test-Path $exe) {
    try {
      & takeown.exe /F $exe 2>&1 | Out-Null
      & icacls.exe $exe /grant 'administrators:F' 2>&1 | Out-Null
      Remove-Item -Path $exe -Force -ErrorAction SilentlyContinue
    } catch {}
  }
}

$winsxs = """$env:SystemRoot\WinSxS"""
if (Test-Path $winsxs) {
  Get-ChildItem -Path $winsxs -Directory -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -like '*microsoft-windows-onedrive-setup*' } |
    ForEach-Object {
      $target = Join-Path $_.FullName 'OneDriveSetup.exe'
      if (Test-Path $target) {
        try {
          & takeown.exe /F $target 2>&1 | Out-Null
          & icacls.exe $target /grant 'administrators:F' 2>&1 | Out-Null
          Remove-Item -Path $target -Force -ErrorAction SilentlyContinue
        } catch {}
      }
    }
}

$ntu = 'C:\Users\Default\NTUSER.DAT'
if (Test-Path $ntu) {
  reg load 'HKLM\FSOS_OD' $ntu 2>$null | Out-Null
  try {
    $run = 'HKLM:\FSOS_OD\Software\Microsoft\Windows\CurrentVersion\Run'
    if (Test-Path $run) {
      Remove-ItemProperty -Path $run -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue
      Remove-ItemProperty -Path $run -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue
    }
    $runOnce = 'HKLM:\FSOS_OD\Software\Microsoft\Windows\CurrentVersion\RunOnce'
    if (Test-Path $runOnce) {
      Remove-ItemProperty -Path $runOnce -Name 'OneDriveSetup' -Force -ErrorAction SilentlyContinue
      Remove-ItemProperty -Path $runOnce -Name 'OneDrive'      -Force -ErrorAction SilentlyContinue
    }
  } catch {}
  [gc]::Collect(); Start-Sleep -Milliseconds 300
  reg unload 'HKLM\FSOS_OD' 2>$null | Out-Null
}

$defaultOD = 'C:\Users\Default\AppData\Local\Microsoft\OneDrive'
if (Test-Path $defaultOD) {
  try {
    & takeown.exe /F $defaultOD /R /D Y 2>&1 | Out-Null
    & icacls.exe $defaultOD /grant 'administrators:F' /T /C 2>&1 | Out-Null
    Remove-Item -Path $defaultOD -Recurse -Force -ErrorAction SilentlyContinue
  } catch {}
  if (Test-Path $defaultOD) {
    & cmd.exe /c ('rmdir /s /q ' + [char]34 + $defaultOD + [char]34) 2>&1 | Out-Null
  }
}
$defaultODLegacy = 'C:\Users\Default\OneDrive'
if (Test-Path $defaultODLegacy) {
  Remove-Item -Path $defaultODLegacy -Recurse -Force -ErrorAction SilentlyContinue
}
$defaultODLnk = 'C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk'
if (Test-Path $defaultODLnk) {
  Remove-Item -Path $defaultODLnk -Force -ErrorAction SilentlyContinue
}
$global:LASTEXITCODE = 0

    Start-Process -FilePath 'PowerShell' -ArgumentList '-NoP -EP Bypass -File .\\strip-onedrive.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    .\appx-remover.ps1 -Packages @(
  'Microsoft.OneDrive',
  'microsoft.microsoftskydrive',
  'Microsoft.SkyDrive'
)
    Remove-Item -Path '%SystemDrive%\OneDriveTemp' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%ProgramData%\Microsoft OneDrive' -Force -ErrorAction SilentlyContinue
    try {
  $csv = & schtasks.exe /Query /FO CSV 2>$null | ConvertFrom-Csv
  foreach ($t in $csv) {
    $name = $t.TaskName
    if ($name -and ($name -match 'OneDrive')) {
      try { & schtasks.exe /Delete /TN $name /F 2>$null | Out-Null } catch {}
    }
  }
} catch {}
$taskRoots = @(
  (Join-Path $env:windir 'System32\Tasks'),
  (Join-Path $env:windir 'SysWOW64\Tasks')
)
foreach ($root in $taskRoots) {
  if (Test-Path $root) {
    Get-ChildItem -Path $root -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object {
      $_.Name -match 'OneDrive'
    } | ForEach-Object {
      try { Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue } catch {}
    }
  }
}
$global:LASTEXITCODE = 0

    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -Name 'None' -ErrorAction SilentlyContinue
    $clsid = '{018D5C66-4533-4307-9B53-224DE2ED1FE6}'
$hives = @('Registry::HKEY_USERS\.DEFAULT')
if (Test-Path 'Registry::HKEY_USERS\AME_UserHive_Default') {
  $hives += 'Registry::HKEY_USERS\AME_UserHive_Default'
}
Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object {
  $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
} | ForEach-Object { $hives += ('Registry::HKEY_USERS\' + $_.PSChildName) }
foreach ($h in $hives) {
  $p = Join-Path $h ('Software\Classes\CLSID\' + $clsid)
  try {
    New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $p -Name 'System.IsPinnedToNameSpaceTree' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  } catch {}
  $p2 = Join-Path $h ('Software\Classes\Wow6432Node\CLSID\' + $clsid)
  try {
    New-Item -Path $p2 -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $p2 -Name 'System.IsPinnedToNameSpaceTree' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  } catch {}
}
$userProfiles = Get-ChildItem 'C:\Users' -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Public','All Users','Default','Default User','WDAGUtilityAccount')
}
foreach ($prof in $userProfiles) {
  $ntu = Join-Path $prof.FullName 'NTUSER.DAT'
  if (-not (Test-Path $ntu)) { continue }
  $key = 'FSOS_OD_' + ($prof.Name -replace '[^A-Za-z0-9]','')
  & reg.exe load ('HKU\' + $key) $ntu 2>&1 | Out-Null
  if ($LASTEXITCODE -eq 0) {
    try {
      $p = 'Registry::HKEY_USERS\' + $key + '\Software\Classes\CLSID\' + $clsid
      New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
      Set-ItemProperty -Path $p -Name 'System.IsPinnedToNameSpaceTree' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
      $p2 = 'Registry::HKEY_USERS\' + $key + '\Software\Classes\Wow6432Node\CLSID\' + $clsid
      New-Item -Path $p2 -Force -ErrorAction SilentlyContinue | Out-Null
      Set-ItemProperty -Path $p2 -Name 'System.IsPinnedToNameSpaceTree' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    } catch {}
    [gc]::Collect(); Start-Sleep -Milliseconds 300
    & reg.exe unload ('HKU\' + $key) 2>&1 | Out-Null
  }
}
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name 'Microsoft.Xbox*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.GamingApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxGameOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxGamingOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxIdentityProvider*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxSpeechToTextOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Edge.GameAssist*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    $hideKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'
New-Item -Path $hideKey -Force -ErrorAction SilentlyContinue | Out-Null
$existing = (Get-ItemProperty -Path $hideKey -Name 'SettingsPageVisibility' -ErrorAction SilentlyContinue).SettingsPageVisibility
$hidePages = 'gaming-gamebar;gaming-gamemode;gaming-xboxnetworking;gaming-broadcasting;gaming-trueplay;gaming-gamedvr'
if ([string]::IsNullOrEmpty($existing)) {
  $newVal = 'hide:' + $hidePages
} elseif ($existing -like 'hide:*') {
  $current = $existing.Substring(5)
  $merged = ($current + ';' + $hidePages) -split ';' | Where-Object { $_ } | Select-Object -Unique
  $newVal = 'hide:' + ($merged -join ';')
} else {
  $newVal = $existing
}
Set-ItemProperty -Path $hideKey -Name 'SettingsPageVisibility' -Value $newVal -Type String -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    $hideKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'
New-Item -Path $hideKey -Force -ErrorAction SilentlyContinue | Out-Null
$existing = (Get-ItemProperty -Path $hideKey -Name 'SettingsPageVisibility' -ErrorAction SilentlyContinue).SettingsPageVisibility
$hidePages = 'maps;maps-downloadmaps;windowsinsider'
if ([string]::IsNullOrEmpty($existing)) {
  $newVal = 'hide:' + $hidePages
} elseif ($existing -like 'hide:*') {
  $current = $existing.Substring(5)
  $merged = ($current + ';' + $hidePages) -split ';' | Where-Object { $_ } | Select-Object -Unique
  $newVal = 'hide:' + ($merged -join ';')
} else {
  $newVal = $existing
}
Set-ItemProperty -Path $hideKey -Name 'SettingsPageVisibility' -Value $newVal -Type String -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    $patterns = @('*Microsoft Store*')
$extensions = @('.lnk','.url','.appref-ms')
$roots = New-Object System.Collections.ArrayList
[void]$roots.Add((Join-Path $env:SystemDrive 'ProgramData\Microsoft\Windows\Start Menu'))
[void]$roots.Add((Join-Path $env:SystemDrive 'Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu'))
[void]$roots.Add((Join-Path $env:SystemDrive 'Users\Default\AppData\Local\Microsoft\Windows\WinX'))
Get-ChildItem (Join-Path $env:SystemDrive 'Users') -Directory -ErrorAction SilentlyContinue |
  Where-Object { $_.Name -notin @('Public','Default','All Users','WDAGUtilityAccount') } |
  ForEach-Object {
    [void]$roots.Add((Join-Path $_.FullName 'AppData\Roaming\Microsoft\Windows\Start Menu'))
    [void]$roots.Add((Join-Path $_.FullName 'AppData\Local\Microsoft\Windows\WinX'))
  }
$shell = New-Object -ComObject WScript.Shell -ErrorAction SilentlyContinue
foreach ($root in $roots) {
  if (Test-Path $root) {
    try {
      $allLnks = Get-ChildItem -Path $root -Recurse -Force -File -ErrorAction SilentlyContinue | Where-Object {
        $extensions -contains $_.Extension.ToLower()
      }
      foreach ($item in $allLnks) {
        $matched = $false
        foreach ($pat in $patterns) { if ($item.Name -like $pat) { $matched = $true; break } }
        $orphan = $false
        if (-not $matched -and $item.Extension.ToLower() -eq '.lnk' -and $shell) {
          try {
            $sc = $shell.CreateShortcut($item.FullName)
            $tgt = $sc.TargetPath
            if ($tgt -and -not (Test-Path $tgt) -and $tgt -notmatch '^https?://' -and $tgt -notmatch '^[a-z]+:[^\\]') {
              $orphan = $true
            }
          } catch {}
        }
        if ($matched -or $orphan) {
          try { Remove-Item -Path $item.FullName -Force -ErrorAction SilentlyContinue } catch {}
        }
      }
    } catch {}
  }
}
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsStore*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.StorePurchaseApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    try {
  $patterns = @('Microsoft.WindowsStore','Microsoft.StorePurchaseApp')
  Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | Where-Object {
    $n = $_.Name
    $patterns | Where-Object { $n -eq $_ -or $n -like ($_ + '.*') }
  } | ForEach-Object {
    try { Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction SilentlyContinue } catch {}
  }
  Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object {
    $dn = $_.DisplayName
    $patterns | Where-Object { $dn -eq $_ -or $dn -like ($_ + '*') }
  } | ForEach-Object {
    try { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue } catch {}
  }
  $appRepo = Join-Path $env:ProgramData 'Microsoft\Windows\AppRepository\Packages'
  if (Test-Path $appRepo) {
    Get-ChildItem -Path $appRepo -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
      $name = $_.Name
      $patterns | Where-Object { $name -like ($_ + '_*') }
    } | ForEach-Object {
      $dir = $_.FullName
      try {
        Start-Process -FilePath 'takeown.exe' -ArgumentList ('/F','"' + $dir + '"','/R','/D','Y') -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
        Start-Process -FilePath 'icacls.exe' -ArgumentList ('"' + $dir + '"','/grant','administrators:F','/T','/C') -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
        Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
      } catch {}
    }
  }
  $stagingRoot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications'
  if (Test-Path $stagingRoot) {
    Get-ChildItem -Path $stagingRoot -ErrorAction SilentlyContinue | Where-Object {
      $n = $_.PSChildName
      $patterns | Where-Object { $n -like ($_ + '_*') }
    } | ForEach-Object {
      try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
    }
  }
  $stateChange = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateChange\PackageList'
  if (Test-Path $stateChange) {
    Get-ChildItem -Path $stateChange -ErrorAction SilentlyContinue | Where-Object {
      $n = $_.PSChildName
      $patterns | Where-Object { $n -like ($_ + '_*') }
    } | ForEach-Object {
      try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
    }
  }
  $repoCache = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages'
  if (Test-Path $repoCache) {
    Get-ChildItem -Path $repoCache -ErrorAction SilentlyContinue | Where-Object {
      $n = $_.PSChildName
      $patterns | Where-Object { $n -like ($_ + '_*') }
    } | ForEach-Object {
      try {
        $key = $_.PSPath
        & takeown.exe /F ('HKLM\' + ($key -replace '^Registry::HKEY_LOCAL_MACHINE\\','')) 2>&1 | Out-Null
        Remove-Item -Path $key -Recurse -Force -ErrorAction SilentlyContinue
      } catch {}
    }
  }
  $classRoot = 'HKLM:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages'
  if (Test-Path $classRoot) {
    Get-ChildItem -Path $classRoot -ErrorAction SilentlyContinue | Where-Object {
      $n = $_.PSChildName
      $patterns | Where-Object { $n -like ($_ + '_*') }
    } | ForEach-Object {
      try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
    }
  }
} catch {}
$global:LASTEXITCODE = 0

    Get-ChildItem -Path 'Registry::HKU' -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$' } | ForEach-Object {
  $sid = $_.PSChildName
  try {
    $auxPath = 'Registry::HKU\' + $sid + '\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins'
    if (-not (Test-Path $auxPath)) { New-Item -Path $auxPath -Force -ErrorAction SilentlyContinue | Out-Null }
    Set-ItemProperty -Path $auxPath -Name 'StorePin' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  } catch {}
}
try {
  $sig = '[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] public static extern IntPtr SendMessageTimeout(IntPtr hWnd, uint Msg, UIntPtr wParam, string lParam, uint fuFlags, uint uTimeout, out UIntPtr lpdwResult);'
  $type = Add-Type -MemberDefinition $sig -Name 'NativeMethodsStore' -Namespace 'FSOS' -PassThru -ErrorAction SilentlyContinue
  if ($type) {
    $HWND_BROADCAST = [IntPtr]0xffff
    $WM_SETTINGCHANGE = 0x001A
    $SMTO_ABORTIFHUNG = 0x0002
    $result = [UIntPtr]::Zero
    [void]$type::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [UIntPtr]::Zero, 'TraySettings', $SMTO_ABORTIFHUNG, 1000, [ref]$result)
    [void]$type::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [UIntPtr]::Zero, 'Policy', $SMTO_ABORTIFHUNG, 1000, [ref]$result)
  }
} catch {}
Start-Sleep -Milliseconds 500
$global:LASTEXITCODE = 0

    Stop-Service -Name 'InstallService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'InstallService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PushToInstall' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PushToInstall' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'LicenseManager' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'LicenseManager' -StartupType Disabled -ErrorAction SilentlyContinue
    foreach ($p in @('NisSrv','SecurityHealthHost','SecurityHealthService','SecurityHealthSystray','MsMpEng')) {
  try { Get-Process -Name $p -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue } catch {}
}
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name '*SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.Apprep.ChxApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    $svcList = @('Sense','WinDefend','MsSecCore','wscsvc','WdFilter','WdBoot','WdNisDrv','WdNisSvc','MsSecWfp','MsSecFlt','wtd','webthreatdefusersvc','webthreatdefsvc','SecurityHealthService')

function Take-RegKeyOwnership {
  param([string]$subKey)
  try {
    $defPriv = [System.Security.AccessControl.RegistryRights]'TakeOwnership,ChangePermissions,ReadKey,QueryValues,SetValue'
    $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'
    $systemSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-18'
    $root = [Microsoft.Win32.Registry]::LocalMachine
    $k = $root.OpenSubKey($subKey, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, [System.Security.AccessControl.RegistryRights]'TakeOwnership,ReadPermissions,ChangePermissions')
    if (-not $k) { return $false }
    $acl = $k.GetAccessControl([System.Security.AccessControl.AccessControlSections]::All)
    $acl.SetOwner($adminSid)
    $k.SetAccessControl($acl)
    $k.Close()
    $k = $root.OpenSubKey($subKey, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, [System.Security.AccessControl.RegistryRights]::ChangePermissions)
    $acl = $k.GetAccessControl([System.Security.AccessControl.AccessControlSections]::All)
    $ruleAdmin = New-Object System.Security.AccessControl.RegistryAccessRule($adminSid,'FullControl','ContainerInherit','None','Allow')
    $ruleSys = New-Object System.Security.AccessControl.RegistryAccessRule($systemSid,'FullControl','ContainerInherit','None','Allow')
    $acl.AddAccessRule($ruleAdmin)
    $acl.AddAccessRule($ruleSys)
    $k.SetAccessControl($acl)
    $k.Close()
    return $true
  } catch { return $false }
}

foreach ($s in $svcList) {
  $subKey = 'SYSTEM\CurrentControlSet\Services\' + $s
  $subKeyPS = 'HKLM:\' + $subKey
  if (-not (Test-Path $subKeyPS)) { continue }
  [void](Take-RegKeyOwnership -subKey $subKey)
  try {
    $rk = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($subKey, $true)
    if ($rk) {
      try { $rk.SetValue('Start', 4, [Microsoft.Win32.RegistryValueKind]::DWord) } catch {}
      try { $rk.DeleteValue('DelayedAutoStart', $false) } catch {}
      if ($s -eq 'WinDefend') {
        try { $rk.SetValue('LaunchProtected', 0, [Microsoft.Win32.RegistryValueKind]::DWord) } catch {}
      }
      $rk.Close()
    }
  } catch {}
  $trigger = Join-Path $subKeyPS 'TriggerInfo'
  if (Test-Path $trigger) {
    [void](Take-RegKeyOwnership -subKey ($subKey + '\TriggerInfo'))
    try { Remove-Item -Path $trigger -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
}

foreach ($s in $svcList) {
  try {
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = 'sc.exe'
    $psi.Arguments = 'stop ' + $s
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $psi.WindowStyle = 'Hidden'
    $p = [System.Diagnostics.Process]::Start($psi)
    if ($p) { [void]$p.WaitForExit(2000); if (-not $p.HasExited) { try { $p.Kill() } catch {} } }
  } catch {}
}
foreach ($s in $svcList) {
  try {
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = 'sc.exe'
    $psi.Arguments = 'delete ' + $s
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $psi.WindowStyle = 'Hidden'
    $p = [System.Diagnostics.Process]::Start($psi)
    if ($p) { [void]$p.WaitForExit(2000); if (-not $p.HasExited) { try { $p.Kill() } catch {} } }
  } catch {}
}

foreach ($s in $svcList) {
  $subKey = 'SYSTEM\CurrentControlSet\Services\' + $s
  $subKeyPS = 'HKLM:\' + $subKey
  if (-not (Test-Path $subKeyPS)) { continue }
  try {
    $rk = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($subKey, $true)
    if ($rk) {
      $cur = $rk.GetValue('Start')
      if ($cur -ne 4) {
        try { $rk.SetValue('Start', 4, [Microsoft.Win32.RegistryValueKind]::DWord) } catch {}
      }
      $rk.Close()
    }
  } catch {}
}
$global:LASTEXITCODE = 0

    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'WindowsDefender' -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthSystray.exe" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthService.exe" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthAgent.dll" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthHost.exe" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthCore.dll" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthProxyStub.dll" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\SecurityHealthUdk.dll" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:systemroot\System32\drivers\WdNisDrv.sys" -Force -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskName 'Windows Defender Cache Maintenance' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Windows Defender Cleanup' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Windows Defender Scheduled Scan' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Windows Defender Verification' -TaskPath '\Microsoft\Windows\Windows Defender\' -ErrorAction SilentlyContinue | Out-Null
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Disable-Feature /FeatureName:"Windows-Defender-Default-Definitions" /NoRestart' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PcaSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'InventorySvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'InventorySvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NPSMSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NPSMSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WpnService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WpnService' -StartupType Disabled -ErrorAction SilentlyContinue
    foreach ($s in @('DiagTrack','PcaSvc','InventorySvc','NPSMSvc','WpnService')) {
  try { Stop-Service -Name $s -Force -ErrorAction SilentlyContinue } catch {}
}
$global:LASTEXITCODE = 0

    foreach ($feat in @('Microsoft-Hyper-V-All','HypervisorPlatform','VirtualMachinePlatform')) {
  try {
    $f = Get-WindowsOptionalFeature -Online -FeatureName $feat -ErrorAction SilentlyContinue
    if ($f -and $f.State -eq 'Enabled') {
      Disable-WindowsOptionalFeature -Online -FeatureName $feat -NoRestart -ErrorAction SilentlyContinue | Out-Null
    }
  } catch {}
}
$global:LASTEXITCODE = 0

    Start-Process -FilePath 'bcdedit' -ArgumentList '/set hypervisorlaunchtype off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    taskkill /IM smartscreen /F 2>$null
    Set-ProcessMitigation -System -Disable EmulateAtlThunks,SEHOP,ForceRelocateImages,BottomUp,HighEntropy,StrictHandle,SuppressExports,DisableExtensionPoints,BlockDynamicCode,AuditDynamicCode,AuditFont,BlockRemoteImageLoads,AuditRemoteImageLoads -ErrorAction SilentlyContinue
Set-ProcessMitigation -System -Enable DEP,CFG -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    taskkill /IM Teams /F 2>$null
    taskkill /IM ms-teams /F 2>$null
    taskkill /IM msteams /F 2>$null
    taskkill /IM TeamsBackground /F 2>$null
    taskkill /IM Outlook /F 2>$null
    .\appx-remover.ps1 -Packages @(
  'MicrosoftTeams',
  'MSTeams',
  'Flipgrid'
)
    Start-Process -FilePath 'msiexec.exe' -ArgumentList '/qn /norestart /X{A7AB73A3-CB10-4AA5-9D38-6AEFFBDE4C91}' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    foreach ($uninstallPath in @(
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
  'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall',
  'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
)) {
  if (Test-Path $uninstallPath) {
    Get-ChildItem -Path $uninstallPath -ErrorAction SilentlyContinue | ForEach-Object {
      try {
        $dn = (Get-ItemProperty -Path $_.PSPath -Name 'DisplayName' -ErrorAction SilentlyContinue).DisplayName
        if ($dn -and ($dn -match 'Teams Meeting Add-?in' -or $dn -match 'TeamsMeetingAddin' -or $dn -match 'Teams Machine-Wide Installer')) {
          $productCode = $_.PSChildName
          if ($productCode -match '^\{[A-F0-9\-]+\}$') {
            $psi = New-Object System.Diagnostics.ProcessStartInfo
            $psi.FileName = 'msiexec.exe'
            $psi.Arguments = '/x ' + $productCode + ' /qn /norestart'
            $psi.UseShellExecute = $false
            $psi.CreateNoWindow = $true
            $psi.WindowStyle = 'Hidden'
            try { $p = [System.Diagnostics.Process]::Start($psi); $p.WaitForExit(300000) | Out-Null } catch {}
          }
        }
      } catch {}
    }
  }
}
$global:LASTEXITCODE = 0

    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Teams Machine-Wide Installer' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Teams Machine-Wide Installer' -Recurse -Force -ErrorAction SilentlyContinue
    try { & schtasks.exe /Delete /TN '\\Microsoft\\Windows\\TeamsUpdaterDaemon' /F 2>$null | Out-Null } catch {}
try { & schtasks.exe /Delete /TN 'TeamsMachineUninstallerFallBack' /F 2>$null | Out-Null } catch {}
try { & schtasks.exe /Delete /TN 'TeamsMachineUninstallerLogonFallBack' /F 2>$null | Out-Null } catch {}
$global:LASTEXITCODE = 0

    Start-Process -FilePath 'PowerShell' -ArgumentList '-NoP -EP Bypass -File .\\strip-edge.ps1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.TaskName -like 'MicrosoftEdgeUpdateTaskMachine*' -or $_.TaskName -like 'MicrosoftEdgeUpdateTaskUser*' -or $_.TaskName -like 'MicrosoftEdgeUpdateBrowserReplacement*' } | ForEach-Object {
  Unregister-ScheduledTask -TaskName $_.TaskName -TaskPath $_.TaskPath -Confirm:$false -ErrorAction SilentlyContinue
}
Get-Process -Name 'MicrosoftEdgeUpdate*' -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    $q = [char]39
$inner = 'foreach ($r in @(' + $q + 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' + $q + ',' + $q + 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Run' + $q + ',' + $q + 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run' + $q + ')) { if (Test-Path $r) { try { $i = Get-Item -Path $r -ErrorAction SilentlyContinue; if ($i) { foreach ($v in $i.GetValueNames()) { if ($v -like ' + $q + 'MicrosoftEdgeAutoLaunch*' + $q + ') { Remove-ItemProperty -Path $r -Name $v -Force -ErrorAction SilentlyContinue } } } } catch {} } }'
$ps = 'powershell.exe -NoP -EP Bypass -WindowStyle Hidden -Command ' + $q + $inner + $q
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce' -Force -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce' -Name 'FSOSEdgeAutoLaunchNuke' -Value $ps -Type String -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    Stop-Service -Name 'Spooler' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Spooler' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PrintNotify' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PrintNotify' -StartupType Disabled -ErrorAction SilentlyContinue
    try {
  $svc = Get-Service -Name 'lfsvc' -ErrorAction SilentlyContinue
  if ($svc) {
    try { Stop-Service -Name 'lfsvc' -Force -ErrorAction SilentlyContinue } catch {}
    Start-Sleep -Milliseconds 500
    $svc2 = Get-Service -Name 'lfsvc' -ErrorAction SilentlyContinue
  } else {
  }
} catch {}
$sensorGuid = '{BFA794E4-F964-4FDB-90F6-51056BFE4B44}'
foreach ($basePair in @(
  @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides', 'Overrides'),
  @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions', 'Permissions')
)) {
  $base = $basePair[0]
  $label = $basePair[1]
  $target = Join-Path $base $sensorGuid
  try {
    New-Item -Path $target -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $target -Name 'SensorPermissionState' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    $verify = (Get-ItemProperty -Path $target -Name 'SensorPermissionState' -ErrorAction SilentlyContinue).SensorPermissionState
  } catch {}
}
try {
  $svcCfg = 'HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration'
  New-Item -Path $svcCfg -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $svcCfg -Name 'Status' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  $verify = (Get-ItemProperty -Path $svcCfg -Name 'Status' -ErrorAction SilentlyContinue).Status
} catch {}
try {
  $csPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location'
  New-Item -Path $csPath -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $csPath -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue
  $verify = (Get-ItemProperty -Path $csPath -Name 'Value' -ErrorAction SilentlyContinue).Value
} catch {}
try {
  $triggerKey = 'HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\TriggerInfo'
  if (Test-Path $triggerKey) {
    Remove-Item -Path $triggerKey -Recurse -Force -ErrorAction SilentlyContinue
  } else {
  }
} catch {}
$global:LASTEXITCODE = 0

    Stop-Service -Name 'lfsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lfsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    $allowCaps = @('webcam','microphone')
$skipCaps = @('radios','bluetoothSync','bluetooth','wifiData','cellularData','wifiDirect','nearShareLegacy','otherDevices')

$hklmStore = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore'
$discoveredCaps = @()
try {
  $discoveredCaps = Get-ChildItem -Path $hklmStore -ErrorAction SilentlyContinue |
                    ForEach-Object { $_.PSChildName }
} catch {}
$knownCaps = @(
  'userAccountInformation','contacts','appointments','phoneCall',
  'phoneCallHistory','email','userDataTasks','voiceActivation',
  'userNotificationListener','chat',
  'appDiagnostics','automaticFileDownloads','documentsLibrary',
  'downloadsFolder','musicLibrary','picturesLibrary','videosLibrary',
  'broadFileSystemAccess','graphicsCaptureWithoutBorder',
  'graphicsCaptureProgrammatic','generativeAi','credentialAccess',
  'location','activity','humanPresence',
  'eyeTracker','gazeInput','sensors.custom',
  'phoneCallHistoryPublic','sms','textAndImageGeneration',
  'screenshotsAndScreenRecording','screenshotBorders','passkeys','voipCall'
)
$allCaps = @($discoveredCaps + $knownCaps | Sort-Object -Unique)
$denyCaps = $allCaps | Where-Object { $_ -notin $allowCaps -and $_ -notin $skipCaps }

$mappingsRoot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\CapabilityMappings'
$capToGuids = @{}
try {
  Get-ChildItem -Path $mappingsRoot -ErrorAction SilentlyContinue | ForEach-Object {
    $capName = $_.PSChildName
    $guids = @()
    try {
      $guids = Get-ChildItem -Path $_.PSPath -ErrorAction SilentlyContinue |
               ForEach-Object { $_.PSChildName } |
               Where-Object { $_ -match '^\{[0-9A-Fa-f-]+\}$' }
    } catch {}
    if ($guids.Count -gt 0) { $capToGuids[$capName] = $guids }
  }
} catch {}

function Set-ConsentStore($storeBase, $capName, $state) {
  $capPath = Join-Path $storeBase $capName
  try {
    New-Item -Path $capPath -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $capPath -Name 'Value' -Value $state -Type String -Force -ErrorAction SilentlyContinue
    $np = Join-Path $capPath 'NonPackaged'
    New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $np -Name 'Value' -Value $state -Type String -Force -ErrorAction SilentlyContinue
  } catch {}
}
function Set-DeviceAccess($daBase, $guid, $state) {
  $gPath = Join-Path $daBase $guid
  try {
    New-Item -Path $gPath -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $gPath -Name 'Value' -Value $state -Type String -Force -ErrorAction SilentlyContinue
  } catch {}
}
function Apply-PrivacyToHive($hiveRoot) {
  $csBase = Join-Path $hiveRoot 'Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore'
  $daBase = Join-Path $hiveRoot 'Microsoft\Windows\CurrentVersion\DeviceAccess\Global'
  foreach ($c in $denyCaps)  {
    Set-ConsentStore $csBase $c 'Deny'
    if ($capToGuids.ContainsKey($c)) {
      foreach ($g in $capToGuids[$c]) { Set-DeviceAccess $daBase $g 'Deny' }
    }
  }
  foreach ($c in $allowCaps) {
    Set-ConsentStore $csBase $c 'Allow'
    if ($capToGuids.ContainsKey($c)) {
      foreach ($g in $capToGuids[$c]) { Set-DeviceAccess $daBase $g 'Allow' }
    }
  }
}

Apply-PrivacyToHive 'HKLM:\SOFTWARE'
Apply-PrivacyToHive 'Registry::HKEY_USERS\.DEFAULT\SOFTWARE'
if (Test-Path 'Registry::HKEY_USERS\AME_UserHive_Default') {
  Apply-PrivacyToHive 'Registry::HKEY_USERS\AME_UserHive_Default\SOFTWARE'
}
Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object {
  $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
} | ForEach-Object {
  $liveRoot = 'Registry::HKEY_USERS\' + $_.PSChildName + '\SOFTWARE'
  Apply-PrivacyToHive $liveRoot
}

try { Restart-Service -Name camsvc -Force -ErrorAction SilentlyContinue } catch {}
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name 'Microsoft.YourPhone*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.CrossDevice*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.CrossDevice*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.CrossDevice_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    Stop-Service -Name 'PhoneSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PhoneSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CDPSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CDPSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskName 'ReconcileFeatures' -TaskPath '\Microsoft\Windows\Flighting\FeatureConfig\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'CleanupResumeTimelineData' -TaskPath '\Microsoft\Windows\CrossDevice\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Resume on Boot' -TaskPath '\Microsoft\Windows\SystemUptime\' -ErrorAction SilentlyContinue | Out-Null
    try {
  New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume' -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume' -Name 'Enabled' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume\Configuration' -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume\Configuration' -Name 'IsResumeAllowed' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP' -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP' -Name 'RomeSdkChannelUserAuthzPolicy' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP' -Name 'CdpSessionUserAuthzPolicy' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP' -Name 'NearShareChannelUserAuthzPolicy' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
} catch {}
Get-Process -Name 'CrossDeviceResume' -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    Get-Process -Name 'CrossDeviceResume' -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers 'MicrosoftWindows.CrossDevice*' -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
Get-AppxPackage 'MicrosoftWindows.CrossDevice*' -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue |
  Where-Object { $_.DisplayName -like 'MicrosoftWindows.CrossDevice*' } |
  ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue }
$global:LASTEXITCODE = 0

    Stop-Service -Name 'WlanSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WlanSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wcncsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wcncsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'bthserv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'bthserv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthAvctpSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthAvctpSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BluetoothUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BluetoothUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    $opts = Join-Path $env:windir 'FSOS\fsos-options.txt'
if (Test-Path $opts) {
  $lines = Get-Content $opts -ErrorAction SilentlyContinue
  $wifiOff = $lines -contains 'disable-wifi'
  $btOff = $lines -contains 'disable-bluetooth'
  if ($wifiOff -and $btOff) {
    $svcRoot = 'HKLM:\SYSTEM\CurrentControlSet\Services'
    foreach ($s in @('RmSvc','DisplayEnhancementService')) {
      $k = Join-Path $svcRoot $s
      if (Test-Path $k) {
        try { Set-ItemProperty -Path $k -Name 'Start' -Value 4 -Type DWord -Force -ErrorAction SilentlyContinue } catch {}
      }
    }
  }
}
$global:LASTEXITCODE = 0

    $targets = @()
if (Test-Path 'Registry::HKEY_USERS\AME_UserHive_Default') {
  $targets += 'Registry::HKEY_USERS\AME_UserHive_Default\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings'
}
Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object {
  $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
} | ForEach-Object {
  $targets += ('Registry::HKEY_USERS\' + $_.PSChildName + '\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings')
}
foreach ($t in $targets) {
  try {
    New-Item -Path $t -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $t -Name 'NOC_GLOBAL_SETTING_SHOW_IN_SETTINGS' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  } catch {}
}
$global:LASTEXITCODE = 0

    Get-ChildItem -Path 'Registry::HKU' -ErrorAction SilentlyContinue | Where-Object {
  $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
} | ForEach-Object {
  $sid = $_.PSChildName
  try {
    $advPath = 'Registry::HKU\' + $sid + '\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
    if (-not (Test-Path $advPath)) { New-Item -Path $advPath -Force -ErrorAction SilentlyContinue | Out-Null }
    Set-ItemProperty -Path $advPath -Name 'ShowCopilotButton' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  } catch {}
  try {
    $auxPath = 'Registry::HKU\' + $sid + '\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins'
    if (-not (Test-Path $auxPath)) { New-Item -Path $auxPath -Force -ErrorAction SilentlyContinue | Out-Null }
    foreach ($n in @('CopilotPin','CopilotPWAPin')) {
      Set-ItemProperty -Path $auxPath -Name $n -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    }
  } catch {}
  try {
    $bingPath = 'Registry::HKU\' + $sid + '\Software\Microsoft\Windows\Shell\Copilot\BingChat'
    if (-not (Test-Path $bingPath)) { New-Item -Path $bingPath -Force -ErrorAction SilentlyContinue | Out-Null }
    Set-ItemProperty -Path $bingPath -Name 'IsUserEligible' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  } catch {}
}
try {
  $sig = '[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] public static extern IntPtr SendMessageTimeout(IntPtr hWnd, uint Msg, UIntPtr wParam, string lParam, uint fuFlags, uint uTimeout, out UIntPtr lpdwResult);'
  $type = Add-Type -MemberDefinition $sig -Name 'NativeMethods' -Namespace 'FSOS' -PassThru -ErrorAction SilentlyContinue
  if ($type) {
    $HWND_BROADCAST = [IntPtr]0xffff
    $WM_SETTINGCHANGE = 0x001A
    $SMTO_ABORTIFHUNG = 0x0002
    $result = [UIntPtr]::Zero
    [void]$type::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [UIntPtr]::Zero, 'TraySettings', $SMTO_ABORTIFHUNG, 1000, [ref]$result)
    [void]$type::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [UIntPtr]::Zero, 'Policy', $SMTO_ABORTIFHUNG, 1000, [ref]$result)
  }
} catch {}
Start-Sleep -Milliseconds 500
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name 'Microsoft.Copilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.Copilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.Client.Copilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftCopilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MSCopilot*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Copilot365*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.Client.AIX*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.Client.CoreAI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.AugLoop.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.UndockedDevKit*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.AVCEncoderVideoExtension*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.ApplicationCompatibilityEnhancements*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Disney.*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MSTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftTeams*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    try {
  $appxList = @(Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -match 'Copilot|Cortana|Recall|Client\.AIX|Client\.Photon|Microsoft365'
  })
  foreach ($pkg in $appxList) {
    try { Remove-AppxPackage -Package $pkg.PackageFullName -AllUsers -ErrorAction SilentlyContinue } catch {}
  }
  $provList = @(Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object {
    $_.DisplayName -match 'Copilot|Cortana|Recall|Client\.AIX|Client\.Photon|Microsoft365'
  })
  foreach ($prov in $provList) {
    try { Remove-AppxProvisionedPackage -Online -PackageName $prov.PackageName -ErrorAction SilentlyContinue } catch {}
  }
} catch {}
try {
  $uninstallRoots = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall','HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall')
  foreach ($root in $uninstallRoots) {
    if (-not (Test-Path $root)) { continue }
    $entries = @(Get-ChildItem -Path $root -ErrorAction SilentlyContinue)
    foreach ($entry in $entries) {
      try {
        $props = Get-ItemProperty -Path $entry.PSPath -ErrorAction SilentlyContinue
        $dn = $props.DisplayName
        if ($dn -and $dn -match 'Copilot|Cortana|Recall') {
          $us = $props.QuietUninstallString
          if (-not $us) { $us = $props.UninstallString }
          if ($us) {
            try {
              $exe = ''
              $args = ''
              if ($us -match '^"([^"]+)"\s*(.*)$') { $exe = $matches[1]; $args = $matches[2] }
              elseif ($us -match '^(\S+)\s*(.*)$') { $exe = $matches[1]; $args = $matches[2] }
              if ($exe -and (Test-Path $exe)) {
                if ($args -notmatch '/quiet|/silent|--force-uninstall') { $args = $args + ' --force-uninstall --system-level' }
                Start-Process -FilePath $exe -ArgumentList $args -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
              }
            } catch {}
          }
          Remove-Item -Path $entry.PSPath -Recurse -Force -ErrorAction SilentlyContinue
        }
      } catch {}
    }
  }
} catch {}
try {
  $copilotDirs = @(
    'C:\Program Files\Microsoft\Copilot',
    'C:\Program Files (x86)\Microsoft\Copilot',
    'C:\Program Files\WindowsApps\Microsoft.Copilot*',
    'C:\Program Files\Microsoft Copilot',
    'C:\Program Files (x86)\Microsoft Copilot'
  )
  foreach ($pat in $copilotDirs) {
    $dirs = @(Get-Item -Path $pat -ErrorAction SilentlyContinue)
    foreach ($d in $dirs) {
      if ($d -and (Test-Path $d.FullName)) {
        try {
          $tkArgs = '/F "' + $d.FullName + '" /R /D Y'
          Start-Process -FilePath 'takeown.exe' -ArgumentList $tkArgs -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
          $icArgs = '"' + $d.FullName + '" /grant administrators:F /T /C'
          Start-Process -FilePath 'icacls.exe' -ArgumentList $icArgs -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
          Remove-Item -Path $d.FullName -Recurse -Force -ErrorAction SilentlyContinue
        } catch {}
      }
    }
  }
} catch {}
try {
  foreach ($task in @('\Microsoft\Windows\WindowsCopilot\*','\Microsoft\Windows\Copilot\*','*Copilot*','*MSCopilot*')) {
    Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.TaskName -like $task -or $_.TaskPath -like $task } | ForEach-Object {
      try { Unregister-ScheduledTask -TaskName $_.TaskName -TaskPath $_.TaskPath -Confirm:$false -ErrorAction SilentlyContinue } catch {}
    }
  }
} catch {}
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.Client.AIX*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Windows.Ai.Copilot.Provider*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.549981C3F5F10*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Copilot_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.AIX_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Ai.Copilot.Provider_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftCopilot_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MSCopilot_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Copilot365_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.AIX_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\Microsoft.Copilot_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\Microsoft.Windows.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\MicrosoftWindows.Client.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\Microsoft.Windows.Ai.Copilot.Provider_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.549981C3F5F10_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    Get-WindowsPackage -Online | Where-Object { $_.PackageName -match 'Recall|Copilot|Client.AIX|Client.Photon|Cortana' } | ForEach-Object {
  Remove-WindowsPackage -Online -PackageName $_.PackageName -NoRestart -ErrorAction SilentlyContinue
}
Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object {
  $_.DisplayName -match 'Copilot|Client\.AIX|Client\.Photon|Cortana|549981C3F5F10'
} | ForEach-Object {
  Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -AllUsers -ErrorAction SilentlyContinue
}
$global:LASTEXITCODE = 0

    .\appx-remover.ps1 -Packages @(
  'Microsoft.Copilot',
  'Microsoft.Windows.Copilot',
  'MicrosoftWindows.Client.Copilot',
  'Microsoft.Windows.Ai.Copilot.Provider',
  'MicrosoftWindows.Client.AIX',
  'MicrosoftWindows.Client.Photon',
  'Microsoft.549981C3F5F10',
  'Microsoft.MicrosoftOfficeHub'
)
    $copilotPackages = @(
  'Microsoft.Copilot_8wekyb3d8bbwe',
  'Microsoft.Windows.Copilot_cw5n1h2txyewy',
  'MicrosoftWindows.Client.Copilot_cw5n1h2txyewy',
  'MicrosoftWindows.Client.AIX_cw5n1h2txyewy',
  'MicrosoftWindows.Client.Photon_cw5n1h2txyewy'
)
$eolBase = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife'
$sids = @('S-1-5-18','S-1-5-19','S-1-5-20')
try {
  Get-ChildItem 'Registry::HKU' -ErrorAction SilentlyContinue | Where-Object {
    $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
  } | ForEach-Object { $sids += $_.PSChildName }
} catch {}
foreach ($sid in ($sids | Select-Object -Unique)) {
  foreach ($pkg in $copilotPackages) {
    $eolPath = Join-Path $eolBase (Join-Path $sid $pkg)
    try {
      New-Item -Path $eolPath -Force -ErrorAction SilentlyContinue | Out-Null
    } catch {}
  }
}
try {
  Get-ChildItem 'Registry::HKU' -ErrorAction SilentlyContinue | Where-Object {
    $_.PSChildName -match 'AME_UserHive'
  } | ForEach-Object {
    foreach ($pkg in $copilotPackages) {
      $eolPath = Join-Path $eolBase (Join-Path $_.PSChildName $pkg)
      try { New-Item -Path $eolPath -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
    }
  }
} catch {}
$global:LASTEXITCODE = 0

    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\CopilotUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler\CopilotUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\MicrosoftWindowsClientAIXUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler\MicrosoftWindowsClientAIXUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\MicrosoftWindowsClientCopilotUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler\MicrosoftWindowsClientCopilotUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    $nraPaths = @(
  'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\ApplicationManagement',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx',
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx'
)
foreach ($nra in $nraPaths) {
  if (Test-Path $nra) {
    try { Remove-ItemProperty -Path $nra -Name 'NonRemovableAppsPolicyList' -Force -ErrorAction SilentlyContinue } catch {}
    try { Remove-ItemProperty -Path $nra -Name 'NonRemovableApps' -Force -ErrorAction SilentlyContinue } catch {}
  }
}
try {
  $policyMod = Get-Command Set-NonRemovableAppsPolicy -ErrorAction SilentlyContinue
  if ($policyMod) {
    foreach ($pkg in @('Microsoft.Copilot','MicrosoftWindows.Client.Copilot','MicrosoftWindows.Client.AIX','MicrosoftWindows.Client.Photon','Microsoft.Windows.Copilot','Microsoft.Windows.Ai.Copilot.Provider')) {
      try { Set-NonRemovableAppsPolicy -PackageFamilyName $pkg -NonRemovable 0 -ErrorAction SilentlyContinue } catch {}
    }
  }
} catch {}
foreach ($taskPath in @(
  '\Microsoft\Windows\WindowsAI\Recall\PolicyConfiguration',
  '\Microsoft\Windows\WindowsAI\Settings\InitialConfiguration',
  '\Microsoft\Windows\WindowsAI\Settings\SettingsConfiguration',
  '\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate'
)) {
  try { Disable-ScheduledTask -TaskName $taskPath -ErrorAction SilentlyContinue | Out-Null } catch {}
  try { Unregister-ScheduledTask -TaskName $taskPath -Confirm:$false -ErrorAction SilentlyContinue } catch {}
}
$global:LASTEXITCODE = 0

    $copilotPatterns = @(
  'Microsoft.Copilot',
  'MicrosoftWindows.Client.Copilot',
  'MicrosoftWindows.Client.AIX',
  'MicrosoftWindows.Client.Photon',
  'Microsoft.Windows.Ai.Copilot.Provider',
  'Microsoft.Windows.Copilot'
)
$winAppsDir = Join-Path $env:ProgramFiles 'WindowsApps'
if (Test-Path $winAppsDir) {
  Get-ChildItem -Path $winAppsDir -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
    $name = $_.Name
    $copilotPatterns | Where-Object { $name -like ($_ + '_*') }
  } | ForEach-Object {
    $dir = $_.FullName
    try {
      & takeown.exe /F $dir /R /D Y 2>&1 | Out-Null
      & icacls.exe $dir /grant 'administrators:F' /T /C 2>&1 | Out-Null
      Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
    } catch {}
  }
}
$winsxs = Join-Path $env:SystemRoot 'WinSxS'
if (Test-Path $winsxs) {
  Get-ChildItem -Path $winsxs -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
    $n = $_.Name.ToLower()
    ($n -like '*microsoft-windows-copilot*') -or ($n -like '*microsoft-windows-client-copilot*') -or ($n -like '*client.aix*') -or ($n -like '*client.photon*') -or ($n -like '*windowsai*')
  } | ForEach-Object {
    $dir = $_.FullName
    try {
      & takeown.exe /F $dir /R /D Y 2>&1 | Out-Null
      & icacls.exe $dir /grant 'administrators:F' /T /C 2>&1 | Out-Null
      Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
    } catch {}
  }
}
$appRepo = Join-Path $env:ProgramData 'Microsoft\Windows\AppRepository\Packages'
if (Test-Path $appRepo) {
  Get-ChildItem -Path $appRepo -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
    $name = $_.Name
    $copilotPatterns | Where-Object { $name -like ($_ + '_*') }
  } | ForEach-Object {
    $dir = $_.FullName
    try {
      & takeown.exe /F $dir /R /D Y 2>&1 | Out-Null
      & icacls.exe $dir /grant 'administrators:F' /T /C 2>&1 | Out-Null
      Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
    } catch {}
  }
}
$stagingRoot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications'
if (Test-Path $stagingRoot) {
  Get-ChildItem -Path $stagingRoot -ErrorAction SilentlyContinue | Where-Object {
    $n = $_.PSChildName
    $copilotPatterns | Where-Object { $n -like ($_ + '_*') }
  } | ForEach-Object {
    try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
}
$inboxRoot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications'
if (Test-Path $inboxRoot) {
  Get-ChildItem -Path $inboxRoot -ErrorAction SilentlyContinue | Where-Object {
    $n = $_.PSChildName
    $copilotPatterns | Where-Object { $n -like ($_ + '_*') }
  } | ForEach-Object {
    try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
}
try {
  $uso = Join-Path $env:SystemRoot 'System32\UsoClient.exe'
  if (Test-Path $uso) {
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $uso
    $psi.Arguments = 'CancelAll'
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $psi.WindowStyle = 'Hidden'
    try { [System.Diagnostics.Process]::Start($psi).WaitForExit(5000) } catch {}
  }
} catch {}
try {
  & schtasks.exe /Change /TN '\Microsoft\Windows\WindowsUpdate\Scheduled Start' /DISABLE 2>&1 | Out-Null
} catch {}
$global:LASTEXITCODE = 0

    try {
  $srpV2Paths = @(
    'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SrpV2',
    'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppLocker'
  )
  foreach ($p in $srpV2Paths) {
    if (Test-Path $p) { Remove-Item -Path $p -Recurse -Force -ErrorAction SilentlyContinue }
  }
  Stop-Service -Name AppIDSvc -Force -ErrorAction SilentlyContinue
  Set-Service -Name AppIDSvc -StartupType Disabled -ErrorAction SilentlyContinue
  Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\AppIDSvc' -Name 'Start' -Value 4 -Type DWord -Force -ErrorAction SilentlyContinue
} catch {}
$global:LASTEXITCODE = 0

    taskkill /IM SearchApp /F 2>$null
    taskkill /IM SearchHost /F 2>$null
    taskkill /IM Widgets /F 2>$null
    $snapPath = Join-Path $env:TEMP 'fsos-appx-snapshot.txt'
if (-not (Test-Path $snapPath)) { return }
try {
  $before = Get-Content -Path $snapPath -ErrorAction SilentlyContinue | Where-Object { $_ }
  $after = (Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue).PackageFamilyName | Sort-Object -Unique
  $removed = @($before | Where-Object { $after -notcontains $_ })
  $deprovBase = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned'
  $appsBase = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications'
  $inboxBase = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications'
  $eolBase = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife'
  $winAppsDir = Join-Path $env:ProgramFiles 'WindowsApps'
  $appRepo = Join-Path $env:ProgramData 'Microsoft\Windows\AppRepository\Packages'
  $winsxs = Join-Path $env:SystemRoot 'WinSxS'
  $sids = @('S-1-5-18','S-1-5-19','S-1-5-20')
  try {
    Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object {
      $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
    } | ForEach-Object { $sids += $_.PSChildName }
  } catch {}
  $sids = $sids | Select-Object -Unique
  foreach ($family in $removed) {
    if ([string]::IsNullOrWhiteSpace($family)) { continue }
    try {
      $dp = Join-Path $deprovBase $family
      if (-not (Test-Path $dp)) { New-Item -Path $dp -Force -ErrorAction SilentlyContinue | Out-Null }
    } catch {}
    foreach ($sid in $sids) {
      try {
        $eol = Join-Path $eolBase (Join-Path $sid $family)
        New-Item -Path $eol -Force -ErrorAction SilentlyContinue | Out-Null
      } catch {}
    }
    $shortName = ($family -split '_')[0]
    if ([string]::IsNullOrWhiteSpace($shortName)) { continue }
    if (Test-Path $winAppsDir) {
      Get-ChildItem -Path $winAppsDir -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like ($shortName + '_*')
      } | ForEach-Object {
        try {
          & takeown.exe /F $_.FullName /R /D Y 2>&1 | Out-Null
          & icacls.exe $_.FullName /grant 'administrators:F' /T /C 2>&1 | Out-Null
          Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
        } catch {}
      }
    }
    if (Test-Path $appRepo) {
      Get-ChildItem -Path $appRepo -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like ($shortName + '_*')
      } | ForEach-Object {
        try {
          & takeown.exe /F $_.FullName /R /D Y 2>&1 | Out-Null
          & icacls.exe $_.FullName /grant 'administrators:F' /T /C 2>&1 | Out-Null
          Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
        } catch {}
      }
    }
    if (Test-Path $appsBase) {
      Get-ChildItem -Path $appsBase -ErrorAction SilentlyContinue | Where-Object {
        $_.PSChildName -like ($shortName + '_*')
      } | ForEach-Object {
        try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
      }
    }
    if (Test-Path $inboxBase) {
      Get-ChildItem -Path $inboxBase -ErrorAction SilentlyContinue | Where-Object {
        $_.PSChildName -like ($shortName + '_*')
      } | ForEach-Object {
        try { Remove-Item -Path $_.PSPath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
      }
    }
    $winsxsPattern = '*' + ($shortName -replace '\.','*').ToLower() + '*'
    if (Test-Path $winsxs) {
      Get-ChildItem -Path $winsxs -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
        $_.Name.ToLower() -like $winsxsPattern
      } | ForEach-Object {
        try {
          & takeown.exe /F $_.FullName /R /D Y 2>&1 | Out-Null
          & icacls.exe $_.FullName /grant 'administrators:F' /T /C 2>&1 | Out-Null
          Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
        } catch {}
      }
    }
  }
} catch {}
Remove-Item -Path $snapPath -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    try {
  $newPkgs = @(Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | ForEach-Object { $_.PackageFamilyName })
  $marker = Join-Path $env:windir 'FSOS\fsos-pkgs-current.txt'
  $newPkgs | Sort-Object -Unique | Set-Content -Path $marker -ErrorAction SilentlyContinue
} catch {}
$global:LASTEXITCODE = 0

    $profiles = @('C:\Users\Default')
Get-ChildItem 'C:\Users' -Directory -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Default User','Public','All Users','Default','WDAGUtilityAccount')
} | ForEach-Object { $profiles += $_.FullName }
foreach ($profile in $profiles) {
  $shellDir = Join-Path $profile 'AppData\Local\Microsoft\Windows\Shell'
  if (Test-Path $shellDir) {
    Get-ChildItem -Path $shellDir -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  }
  $startState = Join-Path $profile 'AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState'
  if (Test-Path $startState) {
    Get-ChildItem -Path $startState -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  }
  $tempState = Join-Path $profile 'AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\TempState'
  if (Test-Path $tempState) {
    Get-ChildItem -Path $tempState -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

}}

$Options += [PSCustomObject]@{Id=526; Cat="Confidentialite"; LabelFR="Harden"; LabelEN="Harden"; Risk="moderate"; Action={
    $denyCaps = @('userAccountInformation','contacts','appointments','phoneCall','phoneCallHistory','email','userDataTasks','chat','documentsLibrary','downloadsFolder','musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess','graphicsCaptureProgrammatic','graphicsCaptureWithoutBorder','generativeAi','credentialAccess','activity','appDiagnostics','userNotificationListener','location','humanPresence','eyeTracker','gazeInput','sensors.custom')
$allowCaps = @('webcam','microphone')
$scope = 'HKLM:'
foreach ($cap in $denyCaps) {
  $base = """$scope\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$cap"""
  New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $base -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue
  $np = """$base\NonPackaged"""
  New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $np -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue
}
foreach ($cap in $allowCaps) {
  $base = """$scope\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$cap"""
  New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $base -Name 'Value' -Value 'Allow' -Type String -Force -ErrorAction SilentlyContinue
  $np = """$base\NonPackaged"""
  New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $np -Name 'Value' -Value 'Allow' -Type String -Force -ErrorAction SilentlyContinue
}
$global:LASTEXITCODE = 0

    $denyCaps = @('userAccountInformation','contacts','appointments','phoneCall','phoneCallHistory','email','userDataTasks','chat','documentsLibrary','downloadsFolder','musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess','graphicsCaptureProgrammatic','graphicsCaptureWithoutBorder','generativeAi','credentialAccess','activity','appDiagnostics','userNotificationListener','location','humanPresence','eyeTracker','gazeInput','sensors.custom')
$allowCaps = @('webcam','microphone')
foreach ($scope in @('Registry::HKEY_CURRENT_USER','Registry::HKEY_USERS\.DEFAULT')) {
  foreach ($cap in $denyCaps) {
    $base = """$scope\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$cap"""
    New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $base -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue
    $np = Join-Path $base 'NonPackaged'
    New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $np -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue
  }
  foreach ($cap in $allowCaps) {
    $base = """$scope\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$cap"""
    New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $base -Name 'Value' -Value 'Allow' -Type String -Force -ErrorAction SilentlyContinue
    $np = Join-Path $base 'NonPackaged'
    New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $np -Name 'Value' -Value 'Allow' -Type String -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

    Stop-Service -Name 'diagnosticshub.standardcollector.service' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagnosticshub.standardcollector.service' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'dmwappushservice' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'dmwappushservice' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'wisvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wisvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MapsBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MapsBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'lfsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lfsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CDPUserSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CDPUserSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    $sids = Get-ChildItem -Path 'Registry::HKU' -ErrorAction SilentlyContinue | Where-Object {
  ($_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$') -or $_.PSChildName -match '^AME_UserHive_' -or $_.PSChildName -eq '.DEFAULT'
}
foreach ($s in $sids) {
  $k = 'Registry::HKU\' + $s.PSChildName + '\Software\Microsoft\Windows\CurrentVersion\Feeds'
  New-Item -Path $k -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $k -Name 'ShellFeedsTaskbarViewMode' -Value 2 -Type DWord -Force -ErrorAction SilentlyContinue
}
$global:LASTEXITCODE = 0

    taskkill /IM SearchHost /F 2>$null
    taskkill /IM SearchApp /F 2>$null
    Stop-Service -Name 'Telemetry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Telemetry' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'GpuEnergyDrv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GpuEnergyDrv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'NetBT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'NetBT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'icssvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'icssvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'lmhosts' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'lmhosts' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TrkWks' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TrkWks' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'edgeupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdate' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'edgeupdatem' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdatem' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'svsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'svsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RetailDemo' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RetailDemo' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WMPNetworkSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WMPNetworkSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DialogBlockingService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DialogBlockingService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AssignedAccessManagerSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AssignedAccessManagerSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'AppVClient' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'AppVClient' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DevQueryBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DevQueryBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'GraphicsPerfSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'GraphicsPerfSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WSAIFabricSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WSAIFabricSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PimIndexMaintenanceSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PimIndexMaintenanceSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'shpamsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'shpamsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ssh-agent' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ssh-agent' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmBroker' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmBroker' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SgrmAgent' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SgrmAgent' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BcastDVRUserService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BcastDVRUserService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'xbgm' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'xbgm' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XblAuthManager' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XblAuthManager' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XblGameSave' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XblGameSave' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'XboxNetApiSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'XboxNetApiSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'uhssvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'uhssvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'whesvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'whesvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Fax' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Fax' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RemoteRegistry' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RemoteRegistry' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RemoteAccess' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RemoteAccess' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SharedAccess' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SharedAccess' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tzautoupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tzautoupdate' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'MessagingService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MessagingService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'EFS' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'EFS' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CscService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CscService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'fdc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'fdc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'flpydisk' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'flpydisk' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'sfloppy' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'sfloppy' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'serial' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'serial' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'serenum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'serenum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'sermouse' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'sermouse' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ErrDev' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ErrDev' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'CompositeBus' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'CompositeBus' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'cdrom' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'cdrom' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name '3ware' -Force -ErrorAction SilentlyContinue; Set-Service -Name '3ware' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SiSRaid2' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SiSRaid2' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SiSRaid4' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SiSRaid4' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'VSTXRAID' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'VSTXRAID' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'arcsas' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'arcsas' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vsmraid' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vsmraid' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'spaceport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'spaceport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SEMgrSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SEMgrSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SCardSvr' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SCardSvr' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'ScDeviceEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'ScDeviceEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TermService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TermService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UmRdpService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UmRdpService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'SessionEnv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'SessionEnv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RDPDR' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RDPDR' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RdpVideominiport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RdpVideominiport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TsUsbFlt' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TsUsbFlt' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'TsUsbGD' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'TsUsbGD' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'rdpbus' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'rdpbus' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'tsusbhub' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'tsusbhub' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'HvHost' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'HvHost' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hvservice' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hvservice' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hvcrash' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hvcrash' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hyperkbd' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hyperkbd' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'hypervideo' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'hypervideo' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Vid' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Vid' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicguestinterface' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicguestinterface' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicheartbeat' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicheartbeat' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmickvpexchange' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmickvpexchange' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicrdv' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicrdv' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicshutdown' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicshutdown' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmictimesync' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmictimesync' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicvmsession' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicvmsession' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'vmicvss' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'vmicvss' -StartupType Disabled -ErrorAction SilentlyContinue
    $restore = @{
  'iphlpsvc'            = 2
  'tcpipreg'            = 2
  'Dnscache'            = 2
  'NlaSvc'              = 2
}
foreach ($kv in $restore.GetEnumerator()) {
  $k = 'HKLM:\SYSTEM\CurrentControlSet\Services\' + $kv.Key
  if (Test-Path $k) {
    try { Set-ItemProperty -Path $k -Name 'Start' -Value $kv.Value -Type DWord -Force -ErrorAction SilentlyContinue } catch {}
  }
}
$global:LASTEXITCODE = 0

    $tasks = @(
  '\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser',
  '\Microsoft\Windows\Application Experience\StartupAppTask',
  '\Microsoft\Windows\Customer Experience Improvement Program\Consolidator',
  '\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip',
  '\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector',
  '\Microsoft\Windows\Feedback\Siuf\DmClient',
  '\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload',
  '\Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures',
  '\Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing',
  '\Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting',
  '\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem',
  '\Microsoft\Windows\Windows Error Reporting\QueueReporting',
  '\Microsoft\Windows\DiskFootprint\Diagnostics',
  '\Microsoft\Windows\Device Information\Device',
  '\Microsoft\Windows\Device Information\Device User',
  '\Microsoft\Windows\Diagnosis\Scheduled',
  '\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner',
  '\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents',
  '\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic',
  '\Microsoft\Windows\PI\Sqm-Tasks',
  '\Microsoft\Windows\UpdateOrchestrator\Schedule Scan',
  '\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work',
  '\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate',
  '\Microsoft\Windows\WindowsUpdate\Scheduled Start',
  '\Microsoft\Windows\WindowsAI\Recall\PolicyConfiguration',
  '\Microsoft\Windows\WindowsAI\Settings\InitialConfiguration',
  '\Microsoft\Windows\Input\LocalUserSyncDataAvailable',
  '\Microsoft\Windows\Input\MouseSyncDataAvailable'
)
foreach ($t in $tasks) { Disable-ScheduledTask -TaskName $t -ErrorAction SilentlyContinue }
$global:LASTEXITCODE = 0

    $tasks = @(
  '\Microsoft\Windows\Maps\MapsToastTask',
  '\Microsoft\Windows\Maps\MapsUpdateTask',
  '\Microsoft\Windows\Location\Notifications',
  '\Microsoft\Windows\Location\WindowsActionDialog'
)
foreach ($t in $tasks) { Disable-ScheduledTask -TaskName $t -ErrorAction SilentlyContinue }
$global:LASTEXITCODE = 0

}}



$Options += [PSCustomObject]@{Id=528; Cat="Confidentialite"; LabelFR="Extended Hardening"; LabelEN="Extended Hardening"; Risk="moderate"; Action={
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\DevHomeUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler\DevHomeUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler\OutlookUpdate' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCR\DesktopBackground\Shell\Idle' -Recurse -Force -ErrorAction SilentlyContinue
    Stop-Service -Name 'wercplsupport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'wercplsupport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'Wecsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Wecsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'diagsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'diagsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'UCPD' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'UCPD' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'WPCMonSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'WPCMonSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'troubleshootingsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'troubleshootingsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    $tasks = @(
  '\Microsoft\Windows\Maintenance\WinSAT',
  '\Microsoft\Windows\Application Experience\MareBackup',
  '\Microsoft\Windows\InstallService\ScanForUpdates',
  '\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task',
  '\Microsoft\Windows\WDI\ResolutionHost',
  '\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver',
  '\Microsoft\Windows\InstallService\ScanForUpdatesAsUser',
  '\Microsoft\Windows\InstallService\SmartRetry',
  '\Microsoft\Windows\Autochk\Proxy',
  '\Microsoft\Windows\Registry\RegIdleBackup',
  '\Microsoft\Windows\AppxDeploymentClient\UCPD velocity',
  '\Microsoft\Windows\Application Experience\PcaPatchDbTask',
  '\Microsoft\Windows\SettingSync\BackgroundUploadTask',
  '\Microsoft\Windows\CloudRestore\Backup',
  '\Microsoft\Windows\CloudRestore\Restore',
  '\Microsoft\Windows\UpdateOrchestrator\Schedule Work',
  '\Microsoft\Windows\UpdateOrchestrator\UUS Failover Task',
  '\Microsoft\Windows\Shell\FamilySafetyMonitor',
  '\Microsoft\Windows\WaaSMedic\PerformRemediation',
  '\Microsoft\Windows\CloudExperienceHost\CreateObjectTask',
  '\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask',
  '\Microsoft\Windows\UPnP\UPnPHostConfig',
  '\Microsoft\Windows\Device Setup\Metadata Refresh',
  '\Microsoft\Windows\Shell\FamilySafetyRefreshTask',
  '\Microsoft\Windows\RetailDemo\CleanupOfflineContent',
  '\Microsoft\Windows\SettingSync\NetworkStateChangeTask',
  '\Microsoft\Windows\Sustainability\SustainabilityTelemetry',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan_LicenseAccepted',
  '\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker',
  '\Microsoft\Windows\ApplicationData\appuriverifierdaily',
  '\Microsoft\Windows\ApplicationData\DsSvcCleanup',
  '\Microsoft\Windows\Input\PenSyncDataAvailable',
  '\Microsoft\Windows\Wininet\CacheTask',
  '\Microsoft\Windows\UpdateOrchestrator\Report Policies',
  '\Microsoft\Windows\ApplicationData\CleanupTemporaryState',
  '\Microsoft\Windows\WindowsUpdate\Refresh Group Policy Cache',
  '\Microsoft\Windows\ApplicationData\appuriverifierinstall',
  '\Microsoft\Windows\UpdateOrchestrator\Report policies',
  '\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp',
  'UCPD velocity',
  '\Microsoft\Windows\WindowsUpdate',
  '\Microsoft\Windows\WaaSMedic',
  '\Microsoft\Windows\WindowsUpdate\AUSessionConnect',
  '\Microsoft\Windows\UpdateOrchestrator\AC Power Download',
  '\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantAllUsersRun',
  '\Microsoft\Windows\UpdateOrchestrator\Maintenance Install',
  '\Microsoft\Windows\WindowsUpdate\Scheduled Start With Network',
  '\Microsoft\Windows\UpdateOrchestrator\Reboot_AC',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan_OobeAppReady',
  '\Microsoft\Windows\UpdateOrchestrator\Universal Orchestrator Idle Start',
  '\Microsoft\Windows\UpdateOrchestrator\Universal Orchestrator Start',
  '\Microsoft\Windows\WindowsUpdate\RUXIM\PLUGScheduler',
  '\Microsoft\Windows\UpdateOrchestrator\USO_Broker_Display',
  '\Microsoft\Windows\UpdateOrchestrator\Battery Saver Deferred Install',
  '\Microsoft\Windows\WindowsUpdate\sih',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan',
  '\Microsoft\Windows\UpdateOrchestrator\MusUx_LogonUpdateResults',
  '\Microsoft\Windows\MemoryDiagnostic\AutomaticOfflineMemoryDiagnostic',
  '\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker_ReadyToReboot',
  '\Microsoft\Windows\UpdateOrchestrator\Schedule Retry Scan',
  '\Microsoft\Windows\UpdateOrchestrator\Refresh Settings',
  '\Microsoft\Windows\UpdateOrchestrator\Resume On Boot',
  '\Microsoft\Windows\UpdateOrchestrator\UpdateAssistant',
  '\Microsoft\Windows\WindowsUpdate\Automatic App Update',
  '\Microsoft\Windows\UpdateOrchestrator\AC Power Install',
  '\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantCalendarRun',
  '\Microsoft\Windows\InstallService\WakeUpAndScanForUpdates',
  '\Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work',
  '\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask',
  '\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantWakeupRun',
  '\Microsoft\Windows\InstallService\WakeUpAndContinueUpdates',
  '\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery',
  '\Microsoft\Windows\UpdateOrchestrator\MusUx_UpdateInterval',
  '\Microsoft\Windows\WindowsUpdate\sihpostreboot',
  '\Microsoft\Windows\UpdateOrchestrator\Policy Install',
  '\Microsoft\Windows\WindowsUpdate\AUScheduledInstall',
  '\Microsoft\Windows\UpdateOrchestrator\UIEOrchestrator',
  '\Microsoft\Windows\InstallService\RestoreDevice',
  '\Microsoft\Windows\UpdateOrchestrator\Reboot',
  '\Microsoft\Windows\Application Experience\ProgramDataUpdater',
  '\Microsoft\Windows\UpdateOrchestrator\UpdateModelTask',
  '\Microsoft\Windows\WindowsUpdate\sihboot',
  '\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker_Display',
  '\Microsoft\Windows\UpdateOrchestrator\Backup Scan',
  '\Microsoft\Windows\UpdateOrchestrator\Driver Install',
  '\Microsoft\Windows\Customer Experience Improvement Program\Server\ServerCeipAssistant',
  '\Microsoft\Windows\Input\TouchPadSyncDataAvailable',
  '\Microsoft\Windows\Input\syncpensettings',
  '\Microsoft\Windows\Shell\sSyncedImageDownload',
  '\Microsoft\Windows\Speech\SpeechModelDownloadTask',
  '\Microsoft\Windows\Shell\ThemesSyncedImageDownload',
  '\Microsoft\Windows\USB\Usb-Notifications',
  '\Microsoft\Windows\International\Synchronize Language Settings',
  '\Microsoft\Windows\Time Synchronization\SynchronizeTime',
  '\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime',
  '\Microsoft\Windows\Input\TouchpadSyncDataAvailable',
  '\Microsoft\Windows\AppListBackup\Backup',
  '\Microsoft\Windows\BrokerInfrastructure\BgTaskRegistrationMaintenanceTask',
  '\Microsoft\Windows\Chkdsk\ProactiveScan',
  '\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan',
  '\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery',
  '\Microsoft\Windows\DeviceDirectoryClient\HandleCommandVerb',
  '\Microsoft\Windows\HelloFace\FODCleanupTask',
  '\Microsoft\Windows\LanguageComponentsInstaller\Installation',
  '\Microsoft\Windows\LanguageComponentsInstaller\Uninstallation',
  '\Microsoft\Windows\NetTrace\GatherNetworkInfo',
  '\Microsoft\Windows\Offline Files\Background Synchronization',
  '\Microsoft\Windows\PushToInstall\LoginCheck',
  '\Microsoft\Windows\PushToInstall\Registration',
  '\Microsoft\Windows\RecoveryEnvironment\VerifyWinRE',
  '\Microsoft\Windows\Servicing\StartComponentCleanup',
  '\Microsoft\Windows\StateRepository\MaintenanceTasks',
  '\Microsoft\Windows\Subscription\EnableLicenseAcquisition',
  '\Microsoft\Windows\Subscription\LicenseAcquisition',
  '\Microsoft\Windows\TPM\Tpm-HASCertRetr',
  '\Microsoft\Windows\TPM\Tpm-Maintenance',
  '\Microsoft\Windows\Workplace Join\Automatic-Device-Join',
  '\Microsoft\Windows\Workplace Join\Device-Sync',
  '\Microsoft\Windows\Workplace Join\Recovery-Check'
)
foreach ($t in $tasks) { Disable-ScheduledTask -TaskName $t -ErrorAction SilentlyContinue }
$oobeTasks = @(
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan_LicenseAccepted',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan_OobeAppReady',
  '\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate',
  '\Microsoft\Windows\PushToInstall\LoginCheck',
  '\Microsoft\Windows\PushToInstall\Registration'
)
foreach ($t in $oobeTasks) {
  try { Unregister-ScheduledTask -TaskName $t -Confirm:$false -ErrorAction SilentlyContinue } catch {}
}
$global:LASTEXITCODE = 0

    Stop-Service -Name 'Microsoft_Bluetooth_AvrcpTransport' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'Microsoft_Bluetooth_AvrcpTransport' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthA4dp' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthA4dp' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthHFEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthHFEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthLEEnum' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthLEEnum' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHMODEM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHMODEM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'RFCOMM' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'RFCOMM' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTAGService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTAGService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHUSB' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHUSB' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BTHPORT' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BTHPORT' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'BthMini' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'BthMini' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'HidBth' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'HidBth' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'DevicesFlowUserSvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DevicesFlowUserSvc' -StartupType Disabled -ErrorAction SilentlyContinue
    try { Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet' -Name 'SubmitSamplesConsent' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue } catch {}
try { Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet' -Name 'SpyNetReporting' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue } catch {}
$global:LASTEXITCODE = 0

    foreach ($k in @('DefenderApiLogger','DefenderAuditLogger')) {
  try {
    $p = """HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\$k"""
    if (Test-Path $p) {
      Set-ItemProperty -Path $p -Name 'Start' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    }
  } catch {}
}
$global:LASTEXITCODE = 0

    Stop-Service -Name 'printworkflowusersvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'printworkflowusersvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PrintDeviceConfigurationService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PrintDeviceConfigurationService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'PrintScanBrokerService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'PrintScanBrokerService' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'usbprint' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'usbprint' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'fhsvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'fhsvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name 'stisvc' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'stisvc' -StartupType Disabled -ErrorAction SilentlyContinue
    Disable-ScheduledTask -TaskName '\Microsoft\XblGameSave\XblGameSaveTask' -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    $hklmKeys = @(
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System\EnableActivityFeed',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCloudSearch',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowSearchHighlights',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AccountNotifications',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync',
  'HKLM:\SOFTWARE\Policies\Microsoft\Speech',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot',
  'HKLM:\SOFTWARE\Policies\Microsoft\FindMyDevice',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsBackup',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging',
  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting',
  'HKLM:\SOFTWARE\Microsoft\InputPersonalization',
  'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\System\AllowTelemetry',
  'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\System\AllowTelemetry',
  'HKLM:\Software\Microsoft\WindowsSelfHost',
  'HKLM:\SOFTWARE\Microsoft\PolicyManager\providers\B5292708-1619-419B-9923-E5D9F3925E71\default\Device\AppPrivacy',
  'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\AppPrivacy'
)
foreach ($k in $hklmKeys) { Remove-Item -Path $k -Recurse -Force -ErrorAction SilentlyContinue }
$global:LASTEXITCODE = 0

    $keys = @(
  'SOFTWARE\Policies\Microsoft\Windows\Personalization',
  'SOFTWARE\Policies\Microsoft\Windows\CloudContent',
  'SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo',
  'SOFTWARE\Policies\Microsoft\Windows\AppPrivacy',
  'SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AccountNotifications',
  'SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications',
  'SOFTWARE\Policies\Microsoft\Windows\AppCompat',
  'SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors',
  'SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting'
)
foreach ($scope in @('Registry::HKEY_CURRENT_USER','Registry::HKEY_USERS\.DEFAULT')) {
  foreach ($k in $keys) {
    Remove-Item -Path """$scope\$k""" -Recurse -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

    $denyCaps = @(
  'userAccountInformation','contacts','appointments','phoneCall','phoneCallHistory','email',
  'userDataTasks','chat','documentsLibrary','downloadsFolder',
  'musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess',
  'graphicsCaptureProgrammatic','graphicsCaptureWithoutBorder','generativeAi',
  'credentialAccess','activity','appDiagnostics','userNotificationListener',
  'location','humanPresence','eyeTracker','gazeInput',
  'sensors.custom','phoneCallHistoryPublic','sms'
)
$allowCaps = @('webcam','microphone')
$base = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore'
function Set-Cap($p, $v) {
  New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $p -Name 'Value' -Value $v -Type String -Force -ErrorAction SilentlyContinue
  $np = """$p\NonPackaged"""
  New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $np -Name 'Value' -Value $v -Type String -Force -ErrorAction SilentlyContinue
}
foreach ($c in $denyCaps) { Set-Cap """$base\$c""" 'Deny' }
foreach ($c in $allowCaps) { Set-Cap """$base\$c""" 'Allow' }
$global:LASTEXITCODE = 0

    $denyCaps = @(
  'userAccountInformation','contacts','appointments','phoneCall','phoneCallHistory','email',
  'userDataTasks','chat','documentsLibrary','downloadsFolder',
  'musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess',
  'graphicsCaptureProgrammatic','graphicsCaptureWithoutBorder','generativeAi',
  'credentialAccess','activity','appDiagnostics','userNotificationListener',
  'location','humanPresence','eyeTracker','gazeInput',
  'sensors.custom','phoneCallHistoryPublic','sms'
)
$allowCaps = @('webcam','microphone')
function Set-Cap($p, $v) {
  New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $p -Name 'Value' -Value $v -Type String -Force -ErrorAction SilentlyContinue
  $np = Join-Path $p 'NonPackaged'
  New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $np -Name 'Value' -Value $v -Type String -Force -ErrorAction SilentlyContinue
}
function Apply-ToHive($hiveBase, $label) {
  $csBase = Join-Path $hiveBase 'SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore'
  $wrote = 0
  foreach ($c in $denyCaps) {
    Set-Cap (Join-Path $csBase $c) 'Deny'
    $wrote++
  }
  foreach ($c in $allowCaps) {
    Set-Cap (Join-Path $csBase $c) 'Allow'
    $wrote++
  }
}
Apply-ToHive 'Registry::HKEY_USERS\.DEFAULT' '.DEFAULT'
if (Test-Path 'Registry::HKEY_USERS\AME_UserHive_Default') {
  Apply-ToHive 'Registry::HKEY_USERS\AME_UserHive_Default' 'AME_UserHive_Default'
}
$liveSids = @(Get-ChildItem 'Registry::HKEY_USERS' -ErrorAction SilentlyContinue | Where-Object {
  $_.PSChildName -match '^S-1-5-21-' -and $_.PSChildName -notmatch '_Classes$'
} | Select-Object -ExpandProperty PSChildName)
foreach ($sid in $liveSids) {
  Apply-ToHive ('Registry::HKEY_USERS\' + $sid) $sid
}
$userProfiles = Get-ChildItem 'C:\Users' -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Public','All Users','Default','Default User','WDAGUtilityAccount')
}
foreach ($prof in $userProfiles) {
  $ntu = Join-Path $prof.FullName 'NTUSER.DAT'
  if (-not (Test-Path $ntu)) { continue }
  $key = 'FSOS_P_' + ($prof.Name -replace '[^A-Za-z0-9]','')
  $loadResult = & reg.exe load ('HKU\' + $key) $ntu 2>&1
  if ($LASTEXITCODE -eq 0) {
    try {
      Apply-ToHive ('Registry::HKEY_USERS\' + $key) $prof.Name
    } catch { Log ('Error applying to ' + $prof.Name + ': ' + $_.Exception.Message) }
    [gc]::Collect(); Start-Sleep -Milliseconds 300
    & reg.exe unload ('HKU\' + $key) 2>&1 | Out-Null
  } else {
  }
}
$ntuDefault = 'C:\Users\Default\NTUSER.DAT'
if (Test-Path $ntuDefault) {
  $loadResult = & reg.exe load 'HKU\FSOS_P_Default' $ntuDefault 2>&1
  if ($LASTEXITCODE -eq 0) {
    try { Apply-ToHive 'Registry::HKEY_USERS\FSOS_P_Default' 'Default' } catch {}
    [gc]::Collect(); Start-Sleep -Milliseconds 300
    & reg.exe unload 'HKU\FSOS_P_Default' 2>&1 | Out-Null
  }
}
$global:LASTEXITCODE = 0

    $profilePath = 'C:\Windows\ServiceProfiles\NetworkService\NTUSER.DAT'
$loaded = $false
if (Test-Path $profilePath) {
  reg load 'HKU\FSOS_NS' $profilePath 2>$null | Out-Null
  if ($LASTEXITCODE -eq 0) { $loaded = $true }
}
$base = if ($loaded) { 'Registry::HKEY_USERS\FSOS_NS\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings' } else { 'Registry::HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings' }
try {
  New-Item -Path $base -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $base -Name 'DownloadRateBackgroundPct' -Value '10' -Type String -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $base -Name 'DownloadRateForegroundPct' -Value '70' -Type String -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $base -Name 'UpRatePctBandwidth' -Value '50' -Type String -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $base -Name 'UploadLimitGBMonth' -Value '500' -Type String -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $base -Name 'DownloadMode' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
} catch {}
if ($loaded) {
  [gc]::Collect(); Start-Sleep -Milliseconds 300
  reg unload 'HKU\FSOS_NS' 2>$null | Out-Null
}
$global:LASTEXITCODE = 0

    Restart-Service -Name DoSvc -Force -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    $srcDat = Join-Path $PWD 'notepad-settings.dat'
if (Test-Path $srcDat) {
  Get-ChildItem 'C:\Users' -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -notin @('Public','Default User','All Users','WDAGUtilityAccount')
  } | ForEach-Object {
    $pkgDir = Join-Path $_.FullName 'AppData\Local\Packages\Microsoft.WindowsNotepad_8wekyb3d8bbwe\Settings'
    if (Test-Path (Split-Path $pkgDir)) {
      New-Item -ItemType Directory -Path $pkgDir -Force -ErrorAction SilentlyContinue | Out-Null
      Copy-Item -Path $srcDat -Destination (Join-Path $pkgDir 'settings.dat') -Force -ErrorAction SilentlyContinue
    }
  }
  $defaultPkg = 'C:\Users\Default\AppData\Local\Packages\Microsoft.WindowsNotepad_8wekyb3d8bbwe\Settings'
  New-Item -ItemType Directory -Path $defaultPkg -Force -ErrorAction SilentlyContinue | Out-Null
  Copy-Item -Path $srcDat -Destination (Join-Path $defaultPkg 'settings.dat') -Force -ErrorAction SilentlyContinue
}
$global:LASTEXITCODE = 0

    $aliasRoots = @(
  'HKCU:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock',
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock'
)
foreach ($r in $aliasRoots) {
  try { New-Item -Path $r -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
  try { Set-ItemProperty -Path $r -Name 'AllowDevelopmentWithoutDevLicense' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue } catch {}
}
$broken = @('wordpad.exe','mspaint.exe','python.exe','python3.exe','winget.exe')
$globalBases = @()
$globalBases += (Join-Path $env:SystemDrive 'Users\Default\AppData\Local\Microsoft\WindowsApps')
foreach ($exe in $broken) {
  foreach ($base in $globalBases) {
    $stub = Join-Path $base $exe
    if (Test-Path $stub) {
      try {
        $item = Get-Item -Path $stub -Force -ErrorAction SilentlyContinue
        if ($item -and ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
          Remove-Item -Path $stub -Force -ErrorAction SilentlyContinue
        }
      } catch {}
    }
  }
}
Get-ChildItem 'C:\Users' -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Public','All Users','Default','Default User','WDAGUtilityAccount')
} | ForEach-Object {
  $base = Join-Path $_.FullName 'AppData\Local\Microsoft\WindowsApps'
  if (Test-Path $base) {
    foreach ($exe in $broken) {
      $stub = Join-Path $base $exe
      if (Test-Path $stub) {
        try {
          $item = Get-Item -Path $stub -Force -ErrorAction SilentlyContinue
          if ($item -and ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
            Remove-Item -Path $stub -Force -ErrorAction SilentlyContinue
          }
        } catch {}
      }
    }
  }
}
$global:LASTEXITCODE = 0

    .\appx-remover.ps1 -Packages @(
  'Microsoft.Copilot',
  'Microsoft.Windows.Copilot',
  'MicrosoftWindows.Client.AIX',
  'MicrosoftWindows.Client.Photon'
)
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Copilot_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Copilot_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.AIX_cw5n1h2txyewy' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCalculator_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Clipchamp.Clipchamp_yxz26nhyzhsrt' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingNews_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingWeather_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingSearch_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Paint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MSPaint_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GetHelp_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Getstarted_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    $opts = @()
$optsFile = Join-Path $env:windir 'FSOS\fsos-options.txt'
if (Test-Path $optsFile) { $opts = Get-Content $optsFile -ErrorAction SilentlyContinue }
$removedAppNames = @(
  'Get Help','Get Started','Tips','Microsoft 365','Microsoft 365 (Office)','Office','Office Hub',
  'Microsoft News','Mail','Outlook','Outlook (new)','Outlook for Windows',
  'Microsoft To Do','To Do','Sticky Notes','Cortana','LinkedIn',
  'Skype','Family','Microsoft Family',
  '3D Viewer','Mixed Reality Portal','Movies & TV','Films & TV',
  'Groove Music','Music','Voice Recorder','Sound Recorder','Maps','Microsoft Bing','Bing',
  'Feedback Hub','Microsoft Photos','Photos','Phone Link','Your Phone','Power Automate',
  'Dev Home','Quick Assist','MSN Weather','Whiteboard','People','Alarms & Clock',
  'Camera','Calendar','Maps','Messaging','Connect','Mixed Reality Viewer','Paint 3D',
  'Spotify','Disney+','Disney','TikTok','Instagram','Prime Video','Netflix','Hulu',
  'Facebook','Twitter','WhatsApp','Messenger','Pandora','iHeartRadio','Spotify Music'
)
if ($opts -contains 'remove-bloat') {
  $removedAppNames += @('Calculator','Clipchamp','Microsoft Clipchamp','News','Weather','Paint','Solitaire','Microsoft Solitaire Collection')
}
if ($opts -contains 'remove-xbox') {
  $removedAppNames += @('Xbox','Xbox Live','Xbox Console Companion','Xbox Game Bar','Game Bar','Game Speech Window')
}
if ($opts -contains 'remove-store') {
  $removedAppNames += @('Microsoft Store','Store')
}
if ($opts -contains 'remove-edge') {
  $removedAppNames += @('Microsoft Edge','Edge')
}
if ($opts -contains 'remove-ai') {
  $removedAppNames += @('Microsoft Copilot','Copilot')
}
$programsRoots = @($env:ProgramData + '\Microsoft\Windows\Start Menu\Programs', 'C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs')
Get-ChildItem 'C:\Users' -Directory -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Public','Default','Default User','All Users','WDAGUtilityAccount')
} | ForEach-Object {
  $programsRoots += (Join-Path $_.FullName 'AppData\Roaming\Microsoft\Windows\Start Menu\Programs')
}
foreach ($root in $programsRoots) {
  if (-not (Test-Path $root)) { continue }
  Get-ChildItem -Path $root -Recurse -Force -Include '*.lnk' -ErrorAction SilentlyContinue | ForEach-Object {
    $lnkName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    foreach ($app in $removedAppNames) {
      if ($lnkName -eq $app -or $lnkName -like ($app + ' (*')) {
        Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
        break
      }
    }
  }
}
$global:LASTEXITCODE = 0

    try {
  $bi = 'HKLM:\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure\Parameters'
  if (Test-Path $bi) {
    Remove-ItemProperty -Path $bi -Name 'ActivityCheckTimerLowPowerPeriodMs' -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $bi -Name 'ActivityCheckTimerPeriodMs' -Force -ErrorAction SilentlyContinue
  }
  $ifeo = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smartscreen.exe'
  if (Test-Path $ifeo) {
    $dbg = Get-ItemProperty -Path $ifeo -Name 'Debugger' -ErrorAction SilentlyContinue
    if ($dbg) { Remove-Item -Path $ifeo -Recurse -Force -ErrorAction SilentlyContinue }
  }
} catch {}
$global:LASTEXITCODE = 0

    $allowList = @('webcam','microphone')
$base = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore'
if (Test-Path $base) {
  Get-ChildItem -Path $base -ErrorAction SilentlyContinue | ForEach-Object {
    $cap = $_.PSChildName
    $target = if ($allowList -contains $cap) { 'Allow' } else { 'Deny' }
    try {
      Set-ItemProperty -Path $_.PSPath -Name 'Value' -Value $target -Type String -Force -ErrorAction SilentlyContinue
      $np = Join-Path $_.PSPath 'NonPackaged'
      if (-not (Test-Path $np)) { New-Item -Path $np -Force -ErrorAction SilentlyContinue | Out-Null }
      Set-ItemProperty -Path $np -Name 'Value' -Value $target -Type String -Force -ErrorAction SilentlyContinue
    } catch {}
  }
}
$global:LASTEXITCODE = 0

    $caps = @('userAccountInformation','contacts','appointments','phoneCall','phoneCallHistory','email','userDataTasks','chat','appDiagnostics','documentsLibrary','downloadsFolder','musicLibrary','picturesLibrary','videosLibrary','broadFileSystemAccess','voipCall','userNotificationListener','voiceActivation')
foreach ($scope in @('Registry::HKEY_CURRENT_USER','Registry::HKEY_USERS\.DEFAULT')) {
  foreach ($c in $caps) {
    $p = Join-Path $scope ('SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\' + $c)
    New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $p -Name 'Value' -Value 'Deny' -Type String -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

    $ntu = 'C:\Users\Default\NTUSER.DAT'
if (Test-Path $ntu) {
  reg load 'HKLM\FSOS_FE' $ntu 2>$null | Out-Null
  $k = 'HKLM:\FSOS_FE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  New-Item -Path $k -Force -ErrorAction SilentlyContinue | Out-Null
  Set-ItemProperty -Path $k -Name 'LaunchTo' -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $k -Name 'ShowFrequent' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $k -Name 'ShowRecent' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
  [gc]::Collect(); Start-Sleep -Milliseconds 300
  reg unload 'HKLM\FSOS_FE' 2>$null | Out-Null
}
$global:LASTEXITCODE = 0

    $ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
$VerbosePreference = 'SilentlyContinue'
$dd = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -ErrorAction SilentlyContinue
if ($dd -and $dd.DisableAntiSpyware -eq 1) { return }
Set-Service -Name 'SecurityHealthService' -StartupType Manual -ErrorAction SilentlyContinue
Set-Service -Name 'wscsvc' -StartupType Automatic -ErrorAction SilentlyContinue
Set-Service -Name 'WinDefend' -StartupType Automatic -ErrorAction SilentlyContinue
$tray = Join-Path $env:windir 'System32\SecurityHealthSystray.exe'
if (Test-Path $tray) {
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'SecurityHealth' -Value ('"' + $tray + '"') -Type ExpandString -Force -ErrorAction SilentlyContinue
}
Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
try {
  Get-AppxPackage Microsoft.SecHealthUI -AllUsers -ErrorAction SilentlyContinue | Reset-AppxPackage -ErrorAction SilentlyContinue
} catch {}
$manifest = Get-ChildItem 'C:\Windows\SystemApps\Microsoft.Windows.SecHealthUI_*\AppxManifest.xml' -ErrorAction SilentlyContinue | Select-Object -First 1
if ($manifest) {
  Add-AppxPackage -DisableDevelopmentMode -Register $manifest.FullName -ForceApplicationShutdown -ErrorAction SilentlyContinue
}
$defPolicy = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender'
if (Test-Path $defPolicy) {
  Remove-Item -Path $defPolicy -Recurse -Force -ErrorAction SilentlyContinue
}
try {
  $psi = New-Object System.Diagnostics.ProcessStartInfo
  $psi.FileName = 'dism.exe'
  $psi.Arguments = '/Online /Cleanup-Image /RestoreHealth /NoRestart'
  $psi.UseShellExecute = $false
  $psi.CreateNoWindow = $true
  $psi.WindowStyle = 'Hidden'
  $psi.RedirectStandardOutput = $true
  $psi.RedirectStandardError = $true
  $proc = [System.Diagnostics.Process]::Start($psi)
  $proc.EnableRaisingEvents = $false
} catch {}
Start-Service -Name 'SecurityHealthService' -ErrorAction SilentlyContinue
Start-Service -Name 'wscsvc' -ErrorAction SilentlyContinue
$global:LASTEXITCODE = 0

    $userProfiles = Get-ChildItem 'C:\Users' -Directory -Force -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -notin @('Public','All Users','WDAGUtilityAccount')
}
$defaultProfile = Get-Item 'C:\Users\Default' -Force -ErrorAction SilentlyContinue
if ($defaultProfile -and ($userProfiles.FullName -notcontains $defaultProfile.FullName)) {
  $userProfiles = @($userProfiles) + $defaultProfile
}
foreach ($profile in $userProfiles) {
  $oneDrivePath = Join-Path $profile.FullName 'AppData\Local\Microsoft\OneDrive'
  if (Test-Path $oneDrivePath) {
    try { Remove-Item -Path $oneDrivePath -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
  $oneDriveRoot = Join-Path $profile.FullName 'OneDrive'
  if (Test-Path $oneDriveRoot) {
    try { Remove-Item -Path $oneDriveRoot -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
  $startMenuLnk = Join-Path $profile.FullName 'AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk'
  if (Test-Path $startMenuLnk) {
    Remove-Item -Path $startMenuLnk -Force -ErrorAction SilentlyContinue
  }
}
$global:LASTEXITCODE = 0

    $consoleGuid = '{B23D10C0-E52E-411E-9D5B-C09FDF709C7D}'
foreach ($scope in @('Registry::HKEY_USERS\.DEFAULT','Registry::HKEY_USERS\AME_UserHive_Default')) {
  $p = Join-Path $scope 'Console\%%Startup'
  try {
    New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $p -Name 'DelegationConsole'  -Value $consoleGuid -Type String -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $p -Name 'DelegationTerminal' -Value $consoleGuid -Type String -Force -ErrorAction SilentlyContinue
  } catch {}
}
$ntu = 'C:\Users\Default\NTUSER.DAT'
if (Test-Path $ntu) {
  reg load 'HKLM\FSOS_TERM' $ntu 2>$null | Out-Null
  try {
    $p = 'HKLM:\FSOS_TERM\Console\%%Startup'
    New-Item -Path $p -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path $p -Name 'DelegationConsole'  -Value $consoleGuid -Type String -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $p -Name 'DelegationTerminal' -Value $consoleGuid -Type String -Force -ErrorAction SilentlyContinue
  } catch {}
  [gc]::Collect(); Start-Sleep -Milliseconds 300
  reg unload 'HKLM\FSOS_TERM' 2>$null | Out-Null
}
$global:LASTEXITCODE = 0

    $sysDrive = $env:SystemDrive
foreach ($folder in @('inetpub','PerfLogs','Windows.old')) {
  $p = Join-Path $sysDrive $folder
  if (Test-Path $p) {
    try {
      & takeown.exe /F $p /R /D Y 2>$null | Out-Null
      & icacls.exe $p /grant 'Administrators:F' /T /C /Q 2>$null | Out-Null
    } catch {}
    try { Remove-Item -Path $p -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
}
$global:LASTEXITCODE = 0

    $autoSvcs = @('Schedule','EventLog','RpcSs','RpcEptMapper','DcomLaunch','Winmgmt','LanmanWorkstation','NlaSvc','netprofm','Dnscache','Dhcp')
$manualSvcs = @('WdiServiceHost','WdiSystemHost','wmiApSrv')
foreach ($svc in ($autoSvcs + $manualSvcs)) {
  try {
    $k = 'HKLM:\SYSTEM\CurrentControlSet\Services\' + $svc
    if (Test-Path $k) {
      $cur = (Get-ItemProperty -Path $k -Name 'Start' -ErrorAction SilentlyContinue).Start
      if ($svc -in $autoSvcs) {
        if ($cur -ne 2) { Set-ItemProperty -Path $k -Name 'Start' -Value 2 -Type DWord -Force -ErrorAction SilentlyContinue }
      } else {
        if ($cur -ne 3) { Set-ItemProperty -Path $k -Name 'Start' -Value 3 -Type DWord -Force -ErrorAction SilentlyContinue }
      }
    }
  } catch {}
}
$global:LASTEXITCODE = 0

    Get-AppxPackage -AllUsers -Name 'Microsoft.Xbox*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.GamingApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxGameOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxGamingOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxIdentityProvider*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.XboxSpeechToTextOverlay*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Edge.GameAssist*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsStore*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.StorePurchaseApp*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.OutlookForWindows*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.OutlookPWA*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingNews*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingWeather*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.BingSearch*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Getstarted*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.People*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WindowsFeedbackHub*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftWindows.Client.WebExperience*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.WidgetsPlatformRuntime*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*MicrosoftWindows.Client.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Microsoft.Windows.SecHealthUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=529; Cat="Confidentialite"; LabelFR="FinalTasks.yml"; LabelEN="FinalTasks.yml"; Risk="moderate"; Action={
    Get-AppxPackage -AllUsers -Name '*Client.CBS*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*StartMenuExperienceHost*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*Windows.Search*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name '*TCUI*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    .\WALLPAPER.ps1 -Mode Desktop -ImagePath $env:systemroot\Web\Sapphire\img0.jpg
    Start-Process -FilePath 'powerplan.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /set-reservedstoragestate /state:disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=530; Cat="Confidentialite"; LabelFR="commands.yml"; LabelEN="commands.yml"; Risk="moderate"; Action={
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} description "SapphireOS"' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set bootmenupolicy Legacy' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set disabledynamictick yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} recoveryenabled no' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} disableelamdrivers yes' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} integrityservices disable' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} hypervisorlaunchtype off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} vm off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'bcdedit' -ArgumentList '/set {current} vsmlaunchtype off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '-h off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'label' -ArgumentList '%systemdrive% SapphireOS' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'fsutil' -ArgumentList 'behavior set disablelastaccess 1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'fsutil' -ArgumentList 'behavior set disable8dot3 1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'fsutil' -ArgumentList 'behavior set disabledeletenotify 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'fsutil' -ArgumentList 'behavior set encryptpagingfile 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    setx DOTNET_CLI_TELEMETRY_OPTOUT 1
    setx DOTNET_TRY_CLI_TELEMETRY_OPTOUT 1
    setx CLOUDSDK_CORE_DISABLE_PROMPTS 1
    setx DOCKER_CLI_TELEMETRY_OPTOUT 1
    setx npm_config_loglevel silent
    setx VS_TELEMETRY_OPT_OUT 1 
    Disable-MMAgent -MemoryCompression
    Start-Process -FilePath 'disable-process-mitigations.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'disable-powersavings.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'disable-write-cache-buffering.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'disable-netbios.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    xcopy "Windows" "%windir%" /E /I /Y
    .\svchost.ps1
    .\Bitlocker.ps1
    .\DisableDefender.ps1
    Start-Process -FilePath 'DEVMANVIEW.CMD' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    xcopy /y "SapphireTool.exe.lnk" "%USERPROFILE%\Desktop"
    xcopy /y "PostInstall.lnk" "%USERPROFILE%\Desktop"
    xcopy  "SapphireTool" "C:\SapphireTool" /E /I /H /Y
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.20/windowsdesktop-runtime-8.0.20-win-x64.exe', 'C:\PostInstall\runtime.exe')"
    C:\PostInstall\runtime.exe /install /quiet /norestart
    del C:\PostInstall\runtime.exe /F /Q
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/abbodi1406/vcredist/releases/download/v0.101.0/VisualCppRedist_AIO_x86_x64.exe', 'C:\PostInstall\vcpp.exe')"
    C:\PostInstall\vcpp.exe /ai
    del C:\PostInstall\vcpp.exe /F /Q
}}

$Options += [PSCustomObject]@{Id=531; Cat="Confidentialite"; LabelFR="registry.yml"; LabelEN="registry.yml"; Risk="moderate"; Action={
    Start-Process -FilePath 'rundll32.exe' -ArgumentList 'fthsvc.dll,FthSysprepSpecialize' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=532; Cat="Confidentialite"; LabelFR="Oneclick V8.4 (Community)"; LabelEN="Oneclick V8.4 (Community)"; Risk="moderate"; Action={
    sc config "ucpd" start=disabled >nul 2>&1
    sc config TrustedInstaller start=auto >nul 2>&1
    sc config VSS start=demand >nul 2>&1
    sc config swprv start=demand >nul 2>&1
    netsh interface teredo set state disabled >nul 2>&1
    sc config AarSvc start=disabled
    sc config ADPSvc start=disabled >nul 2>&1
    sc config AJRouter start=disabled >nul 2>&1
    sc config ALG start=disabled
    sc config AppMgmt start=disabled >nul 2>&1
    sc config AppInfo start=demand
    sc config AppReadiness start=disabled
    sc config AssignedAccessManagerSvc start=disabled >nul 2>&1
    sc config autotimesvc start=disabled
    sc config AxInstSV start=disabled
    sc config BcastDVRUserService start=disabled
    sc config BDESVC start=disabled >nul 2>&1
    sc config BITS start=disabled
    sc config BluetoothUserService start=disabled
    sc config BTAGService start=disabled
    sc config BthAvctpSvc start=disabled
    sc config bthserv start=disabled
    sc config CaptureService start=disabled
    sc config cbdhsvc start=disabled
    sc config CDPUserSvc start=disabled
    sc config CDPSvc start=disabled
    sc config CertPropSvc start=disabled
    sc config CloudBackupRestoreSvc start=disabled >nul 2>&1
    sc config cloudidsvc start=disabled >nul 2>&1
    sc config COMSysApp start=disabled
    sc config ConsentUxUserSvc start=disabled
    sc config CscService start=disabled >nul 2>&1
    sc config dcsvc start=disabled
    sc config defragsvc start=demand
    sc config DeviceAssociationService start=disabled
    sc config DeviceInstall start=disabled
    sc config DevicePickerUserSvc start=disabled
    sc config DevicesFlowUserSvc start=disabled
    sc config DevQueryBroker start=disabled
    sc config diagnosticshub.standardcollector.service start=disabled >nul 2>&1
    sc config DiagTrack start=disabled
    sc config diagsvc start=disabled
    sc config DispBrokerDesktopSvc start=auto
    sc config DisplayEnhancementService start=disabled
    sc config DmEnrollmentSvc start=disabled
    sc config dmwappushservice start=disabled
    sc config dot3svc start=disabled
    sc config DPS start=disabled
    sc config DsmSvc start=disabled
    sc config DsSvc start=disabled
    sc config DusmSvc start=disabled
    sc config Eaphost start=disabled
    sc config edgeupdate start=disabled
    sc config edgeupdatem start=disabled
    sc config EFS start=disabled
    sc config EventLog start=disabled
    sc config EventSystem start=demand
    sc config fdPHost start=disabled
    sc config FDResPub start=disabled
    sc config fhsvc start=disabled
    sc config FontCache start=disabled
    sc config FrameServer start=disabled
    sc config FrameServerMonitor start=disabled
    sc config GameInputSvc start=disabled >nul 2>&1
    sc config GraphicsPerfSvc start=disabled
    sc config hpatchmon start=disabled >nul 2>&1
    sc config hidserv start=disabled
    sc config HvHost start=disabled
    sc config icssvc start=disabled
    sc config IKEEXT start=disabled
    sc config InstallService start=disabled
    sc config InventorySvc start=disabled
    sc config IpxlatCfgSvc start=disabled
    sc config KtmRm start=disabled
    sc config LanmanServer start=disabled
    sc config LanmanWorkstation start=disabled
    sc config lfsvc start=disabled
    sc config LocalKdc start=disabled >nul 2>&1
    sc config LicenseManager start=disabled
    sc config lltdsvc start=disabled
    sc config lmhosts start=disabled
    sc config LxpSvc start=disabled
    sc config MapsBroker start=disabled
    sc config McpManagementService start=disabled >nul 2>&1
    sc config McmSvc start=disabled >nul 2>&1
    sc config MessagingService start=disabled
    sc config midisrv start=disabled >nul 2>&1
    sc config MSDTC start=disabled
    sc config MSiSCSI start=disabled
    sc config NaturalAuthentication start=disabled
    sc config NcaSvc start=disabled
    sc config NcbService start=disabled
    sc config NcdAutoSetup start=disabled
    sc config Netlogon start=disabled
    sc config Netman start=disabled
    sc config NetSetupSvc start=disabled
    sc config NetTcpPortSharing start=disabled
    sc config NlaSvc start=disabled
    sc config NPSMSvc start=disabled >nul 2>&1
    sc config OneSyncSvc start=disabled
    sc config p2pimsvc start=disabled >nul 2>&1
    sc config p2psvc start=disabled >nul 2>&1
    sc config P9RdrService start=disabled
    sc config PcaSvc start=disabled
    sc config PeerDistSvc start=disabled >nul 2>&1
    sc config PenService start=disabled
    sc config perceptionsimulation start=disabled
    sc config PerfHost start=disabled
    sc config PhoneSvc start=disabled
    sc config PimIndexMaintenanceSvc start=disabled
    sc config pla start=disabled
    sc config PNRPAutoReg start=disabled >nul 2>&1
    sc config PNRPsvc start=disabled >nul 2>&1
    sc config PolicyAgent start=disabled
    sc config PrintDeviceConfigurationService start=disabled >nul 2>&1
    sc config PrintNotify start=disabled
    sc config PrintScanBrokerService start=disabled >nul 2>&1
    sc config PushToInstall start=disabled
    sc config QWAVE start=disabled
    sc config RasAuto start=disabled
    sc config RasMan start=disabled
    sc config refsdedupsvc start=disabled >nul 2>&1
    sc config RemoteAccess start=disabled
    sc config RemoteRegistry start=disabled
    sc config RetailDemo start=disabled
    sc config RmSvc start=disabled
    sc config RpcLocator start=disabled
    sc config SamSs start=disabled
    sc config SCardSvr start=disabled
    sc config ScDeviceEnum start=disabled
    sc config SCPolicySvc start=disabled
    sc config SDRSVC start=disabled
    sc config seclogon start=disabled
    sc config SENS start=disabled
    sc config Sense start=disabled >nul 2>&1
    sc config SensorDataService start=disabled
    sc config SensorService start=disabled
    sc config SensrSvc start=disabled
    sc config SEMgrSvc start=disabled
    sc config SessionEnv start=disabled
    sc config SharedAccess start=disabled
    sc config SharedRealitySvc start=disabled >nul 2>&1
    sc config ShellHWDetection start=disabled
    sc config shpamsvc start=disabled
    sc config SmsRouter start=disabled
    sc config smphost start=disabled
    sc config SNMPTrap start=disabled
    sc config spectrum start=disabled >nul 2>&1
    sc config Spooler start=disabled
    sc config SSDPSRV start=disabled
    sc config ssh-agent start=disabled
    sc config SstpSvc start=disabled
    sc config stisvc start=disabled
    sc config StorSvc start=disabled
    sc config svsvc start=disabled
    sc config SysMain start=disabled
    sc config TapiSrv start=disabled
    sc config TermService start=disabled
    sc config Themes start=disabled
    sc config TieringEngineService start=disabled
    sc config TokenBroker start=disabled
    sc config TrkWks start=disabled
    sc config TroubleshootingSvc start=disabled
    sc config tzautoupdate start=disabled
    sc config UevAgentService start=disabled >nul 2>&1
    sc config uhssvc start=disabled >nul 2>&1
    sc config UmRdpService start=disabled
    sc config UnistoreSvc start=disabled
    sc config upnphost start=disabled
    sc config UserDataSvc start=disabled
    sc config VacSvc start=disabled >nul 2>&1
    sc config VaultSvc start=disabled
    sc config vds start=disabled
    sc config vmicguestinterface start=disabled
    sc config vmicheartbeat start=disabled
    sc config vmickvpexchange start=disabled
    sc config vmicrdv start=disabled
    sc config vmicshutdown start=disabled
    sc config vmictimesync start=disabled
    sc config vmicvmsession start=disabled
    sc config vmicvss start=disabled
    sc config W32Time start=disabled
    sc config WalletService start=disabled
    sc config WarpJITSvc start=disabled
    sc config wbengine start=disabled
    sc config WbioSrvc start=disabled
    sc config Wcmsvc start=disabled
    sc config wcncsvc start=disabled
    sc config WdiServiceHost start=disabled
    sc config WdiSystemHost start=disabled
    sc config WebClient start=disabled
    sc config webthreatdefusersvc start=disabled
    sc config webthreatdefsvc start=disabled
    sc config Wecsvc start=disabled
    sc config WEPHOSTSVC start=disabled
    sc config wercplsupport start=disabled
    sc config WerSvc start=disabled
    sc config WFDSConMgrSvc start=disabled
    sc config whesvc start=disabled >nul 2>&1
    sc config WiaRpc start=disabled
    sc config WinRM start=disabled
    sc config wisvc start=disabled
    sc config WlanSvc start=disabled
    sc config wlidsvc start=disabled
    sc config wlpasvc start=disabled
    sc config WManSvc start=disabled
    sc config wmiApSrv start=disabled
    sc config WMPNetworkSvc start=disabled >nul 2>&1
    sc config workfolderssvc start=disabled
    sc config WpcMonSvc start=disabled
    sc config WPDBusEnum start=disabled
    sc config WpnUserService start=disabled
    sc config WpnService start=disabled
    sc config wuqisvc start=disabled >nul 2>&1
    sc config WSAIFabricSvc start=disabled >nul 2>&1
    sc config WSearch start=disabled
    sc config WwanSvc start=disabled
    sc config XblAuthManager start=disabled
    sc config XblGameSave start=disabled
    sc config XboxGipSvc start=disabled
    sc config XboxNetApiSvc start=disabled
    sc config jhi_service start=disabled >nul 2>&1
    sc config WMIRegistrationService start=disabled >nul 2>&1
    sc config ipfsvc start=disabled >nul 2>&1
    sc config igccservice start=disabled >nul 2>&1
    sc config cplspcon start=disabled >nul 2>&1
    sc config esifsvc start=disabled >nul 2>&1
    sc config LMS start=disabled >nul 2>&1
    sc config ibtsiva start=disabled >nul 2>&1
    sc config cphs start=disabled >nul 2>&1
    sc config DSAService start=disabled >nul 2>&1
    sc config DSAUpdateService start=disabled >nul 2>&1
    sc config RstMwService start=disabled >nul 2>&1
    sc config SystemUsageReportSvc_QUEENCREEK start=disabled >nul 2>&1
    sc config iaStorAfsService start=disabled >nul 2>&1
    sc config "!Svc!" start=disabled >nul 2>&1
    sc config "!Svc!" start=disabled >nul 2>&1
    sc config NVDisplay.ContainerLocalSystem start=disabled >nul 2>&1
    sc config NvContainerLocalSystem start=disabled >nul 2>&1
    sc config FvSVC start=disabled >nul 2>&1
    sc config "!Svc!" start=disabled >nul 2>&1
    sc config RzActionSvc start=disabled >nul 2>&1
    sc config CortexLauncherService start=disabled >nul 2>&1
    sc config HapticService start=disabled >nul 2>&1
    sc config "!Svc!" start=disabled >nul 2>&1
    sc config logi_lamparray_service start=disabled >nul 2>&1
    sc config LGHUBUpdaterService start=disabled >nul 2>&1
    sc config "!Svc!" start=disabled >nul 2>&1
    bcdedit /deletevalue useplatformclock >nul 2>&1
    bcdedit /set useplatformtick no >nul 2>&1
    bcdedit /set disabledynamictick yes >nul 2>&1
    powercfg /hibernate off >nul 2>&1
    powercfg -import "C:\Oneclick Tools\Power Plans\Quaked Ultimate Performance.pow" >nul 2>&1
    powercfg -import "C:\Oneclick Tools\Power Plans\Quaked Ultimate Performance Idle Off.pow" >nul 2>&1
    powercfg /setactive %Plan_Guid% >nul 2>&1
    powercfg /setactive %Idle_Off_Plan_Guid% >nul 2>&1
    powercfg.cpl
    sc config LanmanWorkstation start=demand
    sc config WdiServiceHost start=demand
    sc config NcbService start=demand
    sc config ndu start=demand
    sc config Netman start=demand
    sc config netprofm start=demand
    sc config WwanSvc start=demand
    sc config Dhcp start=auto
    sc config DPS start=auto
    sc config lmhosts start=auto
    sc config NlaSvc start=auto
    sc config nsi start=auto
    sc config RmSvc start=auto
    sc config Wcmsvc start=auto
    sc config Winmgmt start=auto
    sc config WlanSvc start=auto
    sc config "EpicGamesUpdater" start=auto >nul 2>&1
    sc config "EpicOnlineServices" start=auto >nul 2>&1
    sc config "Rockstar Service" start=auto >nul 2>&1
    sc config TrustedInstaller start=disabled >nul 2>&1
}}

$Options += [PSCustomObject]@{Id=533; Cat="Confidentialite"; LabelFR="Configuration"; LabelEN="Configuration"; Risk="moderate"; Action={
    Stop-Service -Name 'w32time' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'w32time' -StartupType Manual -ErrorAction SilentlyContinue
    Start-Process -FilePath 'w32tm' -ArgumentList '/config /manualpeerlist:pool.ntp.org /syncfromflags:manual /update' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'w32tm' -ArgumentList '/resync' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-Item -Path '%SYSTEMDRIVE%\Users\Public\Desktop\Microsoft Edge.lnk' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Windows Media Player.lnk' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%WINDIR%\HelpPane.exe' -Force -ErrorAction SilentlyContinue
    Start-Process -FilePath 'COPYEXTRAS.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'XILLYPROMO.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=534; Cat="Confidentialite"; LabelFR="Files"; LabelEN="Files"; Risk="moderate"; Action={
    taskkill /IM explorer /F 2>$null
    taskkill /IM msedge /F 2>$null
    Disable-ScheduledTask -TaskName 'Consolidator' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'KernelCeipTask' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'UsbCeip' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'Microsoft Compatibility Appraiser' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'ProgramDataUpdater' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'StartupAppTask' -TaskPath '\Microsoft\Windows\Application Experience\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'UsbCeip' -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'FODCleanupTask' -TaskPath '\Microsoft\Windows\HelloFace\' -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName 'MapsToastTask' -TaskPath '\Microsoft\Windows\Maps\' -ErrorAction SilentlyContinue | Out-Null
    taskkill /IM SkypeBackgroundHost /F 2>$null
    taskkill /IM SkypeBackgroundHost /F 2>$null
    taskkill /IM OneDrive /F 2>$null
    Remove-Item -Path '%ProgramFiles(x86)%\Windows Mail' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%ProgramW6432%\Windows Mail' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\Microsoft\Diagnosis\ETLLogs\Autologger\AutoLogger-Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\Microsoft\Diagnosis\ETLLogs\Autologger\AutoLogger-Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\Microsoft\Diagnosis\ETLLogs\Autologger\AutoLogger-Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\utc.allow.diffbase' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\analyticsevents.dat' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\utc.privacy.diffbase' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\Settings\utc.app.json' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\Settings\utc.tracing.json' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\RunExeActionAllowedList.dat' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\GetFileActionAllowedList.dat' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\GetFileInfoActionAllowedList.dat' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\Scenarios\windows.uif_ondemand.xml' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\Settings\windows.uif_ondemand.json' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\RemoteAggregatorTriggerCriteria.dat' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\Scenarios\windows.diag_ondemand.xml' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\System32\LogFiles\WMI\Diagtrack-Listener.etl.004' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\DiagTrack\Settings\telemetry.ASM-WindowsDefault.json' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\Microsoft\Diagnosis\ETLLogs\Autologger\AutoLogger-Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\Microsoft\Diagnosis\ETLLogs\Autologger\AutoLogger-Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\Microsoft\Diagnosis\ETLLogs\Autologger\AutoLogger-Diagtrack-Listener.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\System32\Tasks\Microsoft\Windows\Feedback\Siuf\DmClient' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\System32\Tasks\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\Prefetch\SIHCLIENT.EXE-A872A8BF.pf' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.2bdb351a-82b4-4f2c-bc55-ec328ca677be.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.4a695923-0852-4c25-9999-60bc09954fbe.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.5e2840a3-5955-481c-83b8-ddd64cdaa7ae.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.761c6d23-f36c-46be-bf3f-26ba35c4dcca.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.80c59111-3f67-46a5-9fd1-379f4b7c2f7d.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.86ba5ad4-3ec9-43cf-997e-568832e6e2b8.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.ab8bb825-292c-450d-ac06-03e39e89d684.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.2bdb351a-82b4-4f2c-bc55-ec328ca677be.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.4a695923-0852-4c25-9999-60bc09954fbe.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.5e2840a3-5955-481c-83b8-ddd64cdaa7ae.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.761c6d23-f36c-46be-bf3f-26ba35c4dcca.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.80c59111-3f67-46a5-9fd1-379f4b7c2f7d.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.86ba5ad4-3ec9-43cf-997e-568832e6e2b8.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.ab8bb825-292c-450d-ac06-03e39e89d684.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.2bdb351a-82b4-4f2c-bc55-ec328ca677be.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.4a695923-0852-4c25-9999-60bc09954fbe.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.5e2840a3-5955-481c-83b8-ddd64cdaa7ae.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.761c6d23-f36c-46be-bf3f-26ba35c4dcca.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.80c59111-3f67-46a5-9fd1-379f4b7c2f7d.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.86ba5ad4-3ec9-43cf-997e-568832e6e2b8.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.ab8bb825-292c-450d-ac06-03e39e89d684.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\Prefetch\MOUSOCOREWORKER.EXE-681A8FEE.pf' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.2bdb351a-82b4-4f2c-bc55-ec328ca677be.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.4a695923-0852-4c25-9999-60bc09954fbe.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.5e2840a3-5955-481c-83b8-ddd64cdaa7ae.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.761c6d23-f36c-46be-bf3f-26ba35c4dcca.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.80c59111-3f67-46a5-9fd1-379f4b7c2f7d.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.86ba5ad4-3ec9-43cf-997e-568832e6e2b8.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.ab8bb825-292c-450d-ac06-03e39e89d684.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.2bdb351a-82b4-4f2c-bc55-ec328ca677be.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.4a695923-0852-4c25-9999-60bc09954fbe.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.5e2840a3-5955-481c-83b8-ddd64cdaa7ae.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.761c6d23-f36c-46be-bf3f-26ba35c4dcca.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.80c59111-3f67-46a5-9fd1-379f4b7c2f7d.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.86ba5ad4-3ec9-43cf-997e-568832e6e2b8.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\All Users\USOShared\Logs\System\MoUsoCoreWorker.ab8bb825-292c-450d-ac06-03e39e89d684.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.2bdb351a-82b4-4f2c-bc55-ec328ca677be.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.4a695923-0852-4c25-9999-60bc09954fbe.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.5e2840a3-5955-481c-83b8-ddd64cdaa7ae.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.761c6d23-f36c-46be-bf3f-26ba35c4dcca.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.80c59111-3f67-46a5-9fd1-379f4b7c2f7d.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.86ba5ad4-3ec9-43cf-997e-568832e6e2b8.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Documents and Settings\All Users\USOShared\Logs\System\MoUsoCoreWorker.ab8bb825-292c-450d-ac06-03e39e89d684.1.etl' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%windir%\Prefetch\MOUSOCOREWORKER.EXE-681A8FEE.pf' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\Users\Public\Desktop\Microsoft Edge.lnk' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path '%SystemDrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\PC Health Check.lnk' -Force -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=535; Cat="Confidentialite"; LabelFR="Registry Edits"; LabelEN="Registry Edits"; Risk="moderate"; Action={
    Start-Process -FilePath 'REGI.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run' -Name 'SecurityHealth' -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKEY_CLASSES_ROOT\CABFolder\CLSID' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\.cab\CLSID' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKEY_CLASSES_ROOT\CompressedFolder\CLSID' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\.zip\CLSID' -Force -ErrorAction SilentlyContinue | Out-Null
    if ([System.Environment]::OSVersion.Version.Build -le 19045) {
    # Active User
    New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'HidePeopleBar' -Value 1 -Type DWord
    New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds' -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds' -Name 'ShellFeedsTaskbarViewMode' -Value 2 -Type DWord
    New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Value 0 -Type DWord
}

    if ([System.Environment]::OSVersion.Version.Build -le 19045) {
    # Default User (for new accounts)
    reg load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT" 2>&1 | Out-Null
    reg add "HKU\DefaultUser\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d 1 /f 2>&1 | Out-Null
    reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f 2>&1 | Out-Null
    reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f 2>&1 | Out-Null
    reg unload "HKU\DefaultUser" 2>&1 | Out-Null
}

    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.bmp\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpe\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.png\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.gif\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.tif\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Classes\SystemFileAssociations\.tiff\Shell\3D Edit' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\certificate_wab_auto_file' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\wab_auto_file' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\contact_wab_auto_file' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\group_wab_auto_file' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\vcard_wab_auto_file' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\WAB.AssocProtocol.LDAP' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\TIFImage.Document' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\PhotoViewer.FileAssoc.Tiff' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense' -Force -ErrorAction SilentlyContinue | Out-Null
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}' -Recurse -Force -ErrorAction SilentlyContinue
    Start-Process -FilePath 'CONVERT.bat' -ArgumentList '' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=536; Cat="Confidentialite"; LabelFR="Activating Ultimate Performance power plan"; LabelEN="Activating Ultimate Performance power plan"; Risk="moderate"; Action={
    .\set_power_plan.ps1
}}

$Options += [PSCustomObject]@{Id=537; Cat="Confidentialite"; LabelFR="Registry optimizations"; LabelEN="Registry optimizations"; Risk="moderate"; Action={
    .\set_userprefs.ps1
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "*" -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=538; Cat="Confidentialite"; LabelFR="Completely block Windows Update"; LabelEN="Completely block Windows Update"; Risk="moderate"; Action={
    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Set-Service wuauserv -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service UsoSvc -Force -ErrorAction SilentlyContinue; Set-Service UsoSvc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service WaaSMedicSvc -Force -ErrorAction SilentlyContinue; Set-Service WaaSMedicSvc -StartupType Disabled -ErrorAction SilentlyContinue
    .\add_update_hosts.ps1
    Remove-Item -Recurse -Force "C:\Windows\SoftwareDistribution" -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=539; Cat="Confidentialite"; LabelFR="Disable all system notifications"; LabelEN="Disable all system notifications"; Risk="moderate"; Action={
    Stop-Service dmwappushservice -Force -ErrorAction SilentlyContinue; Set-Service dmwappushservice -StartupType Disabled -ErrorAction SilentlyContinue
    gpupdate /force
    taskkill /IM explorer /F 2>$null
    start explorer.exe
}}

$Options += [PSCustomObject]@{Id=540; Cat="Confidentialite"; LabelFR="Rename computer to 'Z LAG OS'"; LabelEN="Rename computer to 'Z LAG OS'"; Risk="moderate"; Action={
    rename_pc.bat
}}

$Options += [PSCustomObject]@{Id=541; Cat="Confidentialite"; LabelFR="Block Microsoft account sign-in"; LabelEN="Block Microsoft account sign-in"; Risk="moderate"; Action={
    Stop-Service wlidsvc -Force -ErrorAction SilentlyContinue; Set-Service wlidsvc -StartupType Disabled -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=542; Cat="Confidentialite"; LabelFR="Configure Z-LAG OS Personalization & Themes"; LabelEN="Configure Z-LAG OS Personalization & Themes"; Risk="moderate"; Action={
    .\set_dark_mousecursor.ps1
    taskkill /IM explorer /F 2>$null
    start explorer.exe
}}

$Options += [PSCustomObject]@{Id=543; Cat="Confidentialite"; LabelFR="Remove Microsoft Edge (Complete)"; LabelEN="Remove Microsoft Edge (Complete)"; Risk="moderate"; Action={
    edge_remover.bat
}}

$Options += [PSCustomObject]@{Id=544; Cat="Confidentialite"; LabelFR="Advanced Performance Tweaks (Beyond Atlas)"; LabelEN="Advanced Performance Tweaks (Beyond Atlas)"; Risk="moderate"; Action={
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
    if (Get-Command Disable-MMAgent -ErrorAction SilentlyContinue) { Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue }
    fsutil behavior set disablelastaccess 1
    fsutil behavior set disable8dot3 1
    Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" | ForEach-Object { Set-ItemProperty -Path $_.PSPath -Name "TCPNoDelay" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue }
    netsh int tcp set global autotuninglevel=disabled
    .\set_smooth_mouse.ps1
    Optimize-Volume -DriveLetter C -ReTrim -ErrorAction SilentlyContinue
    ipconfig /flushdns
    ipconfig /registerdns
}}

$Options += [PSCustomObject]@{Id=545; Cat="Confidentialite"; LabelFR="Removing Bloat Features"; LabelEN="Removing Bloat Features"; Risk="moderate"; Action={
    .\remove_bloat_features.ps1
}}

$Options += [PSCustomObject]@{Id=546; Cat="Confidentialite"; LabelFR="Small Auto-Hide Taskbar"; LabelEN="Small Auto-Hide Taskbar"; Risk="moderate"; Action={
    taskkill /IM explorer /F 2>$null
    start explorer.exe
}}

$Options += [PSCustomObject]@{Id=547; Cat="Confidentialite"; LabelFR="Configure Windows Settings"; LabelEN="Configure Windows Settings"; Risk="moderate"; Action={
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Id' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Id' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKU\.DEFAULT\Software\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=548; Cat="Reseau"; LabelFR="Edge"; LabelEN="Edge"; Risk="moderate"; Action={
    taskkill /IM msedge /F 2>$null
    taskkill /IM msedgewebview2 /F 2>$null
    taskkill /IM MicrosoftEdge* /F 2>$null
    taskkill /IM MicrosoftEdgeUpdate /F 2>$null
    taskkill /IM MicrosoftEdgeElevationService /F 2>$null
    taskkill /IM edge_core /F 2>$null
    taskkill /IM msedgeupdater /F 2>$null
    taskkill /IM MicrosoftEdgeUpdateCom /F 2>$null
    Stop-Service -Name 'edgeupdate' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdate' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'edgeupdatem' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'edgeupdatem' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'MicrosoftEdgeElevationService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MicrosoftEdgeElevationService' -StartupType Manual -ErrorAction SilentlyContinue
    Stop-Service -Name 'MicrosoftEdgeUpdateService' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'MicrosoftEdgeUpdateService' -StartupType Manual -ErrorAction SilentlyContinue
    $edgeUpdate = "${env:ProgramFiles(x86)}\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe"; if (Test-Path $edgeUpdate) {
  Start-Process $edgeUpdate -ArgumentList '/uninstall','/system-level','/force-uninstall' -WindowStyle Hidden -Wait
} Start-Sleep -Seconds 3; Get-Process -Name 'msedge','MicrosoftEdgeUpdate' -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdge.Stable*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdgeDevToolsClient*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.Edge*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'MicrosoftEdge*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdge.Beta*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdge.Canary*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name 'Microsoft.MicrosoftEdgeDev*' | Remove-AppxPackage -ErrorAction SilentlyContinue
    $paths = @(
  "$env:SystemDrive\Users\Public\Desktop\Microsoft Edge.lnk",
  "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk",
  "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk",
  "$env:SystemRoot\system32\MicrosoftEdgeBCHost.exe",
  "$env:SystemRoot\system32\MicrosoftEdgeCP.exe",
  "$env:SystemRoot\system32\MicrosoftEdgeDevTools.exe",
  "$env:SystemRoot\system32\MicrosoftEdgeSH.exe",
  "$env:SystemRoot\system32\ie_storagetrusted.exe",
  "$env:SystemRoot\system32\MicrosoftEdgeCPBroker.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge",
  "${env:ProgramFiles(x86)}\Microsoft\EdgeUpdate",
  "${env:ProgramFiles(x86)}\Microsoft\EdgeCore",
  "${env:ProgramFiles}\Microsoft\Edge",
  "${env:ProgramFiles}\Microsoft\EdgeUpdate",
  "${env:ProgramFiles}\Microsoft\EdgeCore",
  "$env:LOCALAPPDATA\Microsoft\Edge",
  "$env:LOCALAPPDATA\Microsoft\EdgeUpdate",
  "$env:LOCALAPPDATA\Microsoft\EdgeCrashReports",
  "$env:APPDATA\Microsoft\Edge",
  "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_*",
  "$env:SystemRoot\SystemApps\MicrosoftEdge_*",
  "$env:ProgramData\Microsoft\Edge",
  "$env:ProgramData\Microsoft\EdgeUpdate",
  "$env:SystemRoot\Temp\MicrosoftEdge",
  "$env:TEMP\MicrosoftEdge"
); foreach ($p in $paths) {
  if (Test-Path $p) {
    try { Remove-Item $p -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
}
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Edge' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Edge' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCR\MSEdgePDF' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCR\MSEdgeMHT' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Clients\StartMenuInternet\Microsoft Edge' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\RegisteredApplications' -Name 'Microsoft Edge' -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedge.exe' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedgewebview2.exe' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge' -Name 'NoRemove' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge' -Name 'NoModify' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge' -Name 'NoRepair' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\AppExecutionAlias\msedge' -Name 'AppExecutionAlias' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\AppExecutionAlias\msedgebeta' -Name 'AppExecutionAlias' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\AppExecutionAlias\msedgecanary' -Name 'AppExecutionAlias' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\AppExecutionAlias\msedgewebview' -Name 'AppExecutionAlias' -ErrorAction SilentlyContinue
    schtasks /Delete /TN "\Microsoft\EdgeUpdate\*" /F 2>nul
    Get-ScheduledTask | Where-Object { $_.TaskName -like '*MicrosoftEdge*' -or $_.TaskName -like '*EdgeUpdate*' -or $_.TaskPath -like '*MicrosoftEdge*' } | ForEach-Object { Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false -ErrorAction SilentlyContinue }
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Classes\microsoft-edge' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKLM\SOFTWARE\Classes\MSEdgeHTM' -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'Registry::HKCR\microsoft-edge' -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge.Beta_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge.Canary_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdge.Dev_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe' -Force -ErrorAction SilentlyContinue | Out-Null
    $fakePath = "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe"; $null = New-Item -Path (Split-Path $fakePath -Parent) -ItemType Directory -Force -ErrorAction SilentlyContinue; Set-Content -Path $fakePath -Value "" -Encoding ASCII -ErrorAction SilentlyContinue; attrib +R +S +H $fakePath;
    $taskFiles = @(
  "$env:SystemRoot\System32\Tasks\MicrosoftEdgeUpdateTaskMachineCore",
  "$env:SystemRoot\System32\Tasks\MicrosoftEdgeUpdateTaskMachineUA",
  "$env:SystemRoot\System32\Tasks\MicrosoftEdgeUpdateBrowserReplacementTask",
  "$env:SystemRoot\System32\Tasks\MicrosoftEdgeUpdateTaskMachineCoreSystem",
  "$env:SystemRoot\System32\Tasks\Microsoft\EdgeUpdate"
); foreach ($tf in $taskFiles) {
  if (Test-Path $tf) {
    try { takeown.exe /F $tf /A 2>&1 | Out-Null } catch {}
    try { icacls.exe $tf /grant Administrators:F 2>&1 | Out-Null } catch {}
    try { Remove-Item $tf -Recurse -Force -ErrorAction SilentlyContinue } catch {}
  }
}
    $edgeDirs = @(
  "${env:ProgramFiles(x86)}\Microsoft\Edge",
  "${env:ProgramFiles(x86)}\Microsoft\EdgeUpdate",
  "${env:ProgramFiles(x86)}\Microsoft\EdgeCore",
  "$env:ProgramFiles\Microsoft\Edge",
  "$env:ProgramFiles\Microsoft\EdgeUpdate",
  "$env:ProgramFiles\Microsoft\EdgeCore"
); foreach ($d in $edgeDirs) {
  if (-not (Test-Path $d)) { $null = New-Item -Path $d -ItemType Directory -Force -ErrorAction SilentlyContinue }
  if (Test-Path $d) {
    try { icacls.exe $d /deny "SYSTEM:(OI)(CI)(F)" /T /C 2>&1 | Out-Null } catch {}
  }
}
    $hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"; $entries = @(
  "0.0.0.0 edge.microsoft.com",
  "0.0.0.0 msedge.api.cdp.microsoft.com",
  "0.0.0.0 msedge.api.microsoft.com",
  "0.0.0.0 edge.copilot.microsoft.com",
  "0.0.0.0 dl.delivery.mp.microsoft.com",
  "0.0.0.0 dl.delivery.mp.microsoft.com.footprintdns.com",
  "0.0.0.0 msedge.f.dl.delivery.mp.microsoft.com",
  "0.0.0.0 config.edge.skype.com",
  "0.0.0.0 edge.microsoft.com.edgesuite.net",
  "0.0.0.0 browser.events.data.microsoft.com",
  "0.0.0.0 settings-win.data.microsoft.com"
); $content = Get-Content $hostsPath -Raw -ErrorAction SilentlyContinue; $changed = $false; foreach ($e in $entries) {
  if ($content -notmatch [regex]::Escape($e)) {
    Add-Content $hostsPath "`n$e" -ErrorAction SilentlyContinue;
    $changed = $true;
  }
}
}}

$Options += [PSCustomObject]@{Id=549; Cat="Reseau"; LabelFR="Networking & System"; LabelEN="Networking & System"; Risk="moderate"; Action={
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global chimney=disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global dca=enabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global netdma=enabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global timestamps=disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global rss=enabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global nonsackrttresiliency=disabled' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set global maxsynretransmissions=2' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set supplemental template=Internet congestionprovider=ctcp' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'netsh' -ArgumentList 'int tcp set supplemental template=InternetCustom congestionprovider=ctcp' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/h off' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/change standby-timeout-ac 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/change monitor-timeout-ac 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath 'powercfg' -ArgumentList '/setactive SCHEME_CURRENT' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
    New-Item -Path 'Registry::HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=550; Cat="Confidentialite"; LabelFR="Configure Explorer -> Context Menu"; LabelEN="Configure Explorer -> Context Menu"; Risk="moderate"; Action={
    New-Item -Path 'Registry::HKCR\*\shell\runas' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\Directory\shell\runas' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\dllfile\shell\runas' -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path 'Registry::HKCR\exefile\shell\runas' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=551; Cat="Confidentialite"; LabelFR="Remove unwanted context menu items (Enhanced - Aggressive)"; LabelEN="Remove unwanted context menu items (Enhanced - Aggressive)"; Risk="moderate"; Action={
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\setdesktopwallpaper' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\setdesktopwallpaper' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\setdesktopwallpaper' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\giffile\shell\setdesktopwallpaper' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\setdesktopwallpaper' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\setasbackground' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\setaswallpaper' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\rotateleft' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\rotateright' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\rotateleft' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\rotateright' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\rotateleft' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\rotateright' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\rotate' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{F7F24ED4-5F68-4B78-82DA-3C92C3C26775}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{E3A0C2D7-1BFA-45F9-9B9E-2F4F5C6D8E9A}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\*\shellex\ContextMenuHandlers\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Media\shellex\ContextMenuHandlers\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{E1127A54-17A4-4F9D-919E-3C451EF05B0B}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{8C8426FC-77B7-4F15-9CDA-0129E1B79D80}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{43668BF4-1FEE-45E1-B585-DF5F5B64F75B}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{E1127A54-17A4-4F9D-919E-3C451EF05B0B}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{E1127A54-17A4-4F9D-919E-3C451EF05B0B}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\PlayTo' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\CastToDevice' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\Sharing' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\Sharing' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\Sharing' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\Sharing (Legacy)' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\Sharing (Legacy)' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\ModernSharing' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\Send To' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{7BA4C740-9E81-11CF-99D3-00AA004AE837}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\shellex\ContextMenuHandlers\Library Location' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\Library Location' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\Library Location' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\edit' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\edit' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\edit' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\ShellEx\ContextMenuHandlers\{ef1b7f6b-9022-43de-bc6e-fdbe04c1d589}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\ShellEx\ContextMenuHandlers\{ef1b7f6b-9022-43de-bc6e-fdbe04c1d589}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shell\Customize' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\shell\Customize' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77ca}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\PintoStartScreen' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{90aa3a4e-1cba-4233-b8bb-535773d48449}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{90aa3a4e-1cba-4233-b8bb-535773d48449}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\PinToTaskbar' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{50ad69a4-87c3-4a72-b7c4-80c4c3b8f1f9}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{82044F4A-9E7F-4B4F-BDB1-C43559D3BA64}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{679f85cb-0220-4080-b29b-5540cc05aab6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\shellex\ContextMenuHandlers\{679f85cb-0220-4080-b29b-5540cc05aab6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{679f85cb-0220-4080-b29b-5540cc05aab6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\PinToQuickAccess' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{a0eafe71-d696-428a-ade0-6dab634d3fb0}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\shellex\ContextMenuHandlers\{a0eafe71-d696-428a-ade0-6dab634d3fb0}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\SharingWizard' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\exefile\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-146d78461dae}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Application\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-146d78461dae}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\Troubleshoot' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{09A47860-541B-475F-9FA5-D43A2B0D4F5D}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{09A47860-541B-475F-9FA5-D43A2B0D4F5D}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{09A47860-541B-475F-9FA5-D43A2B0D4F5D}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{8369AB20-56C9-11D0-94E8-00AA0059CE02}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\3D Edit' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\3D Edit' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\3D Edit' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\SystemFileAssociations\image\shell\3D Print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\pngfile\shell\3D Print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\jpegfile\shell\3D Print' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\ISOFile\shell\burn' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Windows.IsoFile\shell\burn' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\burn' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shell\burn' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\AudioCD\shell\play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\MediaFile\shell\Play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\WMP11.AssocFile.MP3\shell\Play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\WMP11.AssocFile.AVI\shell\Play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\WMP11.AssocFile.WMV\shell\Play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\WMP11.AssocFile.MP4\shell\Play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\play' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\openas' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\OpenWith' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\OpenWith' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shell\encrypt-bde' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shell\manage-bde' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\encrypt' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Network\Shell\AddToFavorites' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\NetworkLocation\Shell\AddToFavorites' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Network\Shell\AlwaysAvailableOffline' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\NetworkLocation\Shell\AlwaysAvailableOffline' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Network\Shell\MapNetworkDrive' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Network\Shell\DisconnectNetworkDrive' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\shellex\ContextMenuHandlers\{5e3c39a1-9e5f-4518-ac47-9a0bb91c6a1b}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{5e3c39a1-9e5f-4518-ac47-9a0bb91c6a1b}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{7C2CF117-2E48-45E8-AAE0-2721F1F130F8}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shellex\ContextMenuHandlers\{7C2CF117-2E48-45E8-AAE0-2721F1F130F8}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shellex\ContextMenuHandlers\{7C2CF117-2E48-45E8-AAE0-2721F1F130F8}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{5c2c81a0-ee37-4795-9166-39ec11e182ab}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shellex\ContextMenuHandlers\{9cef69de-1a08-4f39-96d1-ac6b9374e012}' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\takeownership' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shell\takeownership' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Drive\shell\takeownership' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Folder\shell\takeownership' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\runas' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\Directory\shell\runas' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\dllfile\shell\runas' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\exefile\shell\runas' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCR\*\shell\restart' -Name 'None' -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\ActionCenter\Quick Actions\All\QuickAction{8E37F5F2-2715-4AB4-90B9-590EBB72ED97}' -Name 'None' -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=422; Cat="Extreme"; LabelFR="Désactiver Game Bar"; LabelEN="Disable Game Bar"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\System\GameConfigStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\System\GameConfigStore' -Name 'GameDVR_Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\GameBar' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\GameBar' -Name 'GamePanelStartupTipIndex' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\GameBar' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\GameBar' -Name 'ShowStartupPanel' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\GameBar' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\GameBar' -Name 'UseNexusForGameBarEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter' -Name 'ActivationType' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Name 'value' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=423; Cat="Extreme"; LabelFR="Désactiver Modern Standby SleepStudy"; LabelEN="Disable Modern Standby SleepStudy"; Risk="safe"; Action={
    Start-Process -FilePath 'wevtutil.exe' -ArgumentList 'set-log "Microsoft-Windows-SleepStudy/Diagnostic" /e:false' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'wevtutil.exe' -ArgumentList 'set-log "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:false' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'wevtutil.exe' -ArgumentList 'set-log "Microsoft-Windows-UserModePowerService/Diagnostic" /e:false' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Disable-ScheduledTask -TaskName 'AnalyzeSystem' -TaskPath '\Microsoft\Windows\Power Efficiency Diagnostics\' -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=424; Cat="Extreme"; LabelFR="Respect Power Modes Windows Search Indexing"; LabelEN="Respect Power Modes Windows Search Indexing"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\Software\Microsoft\Windows Search\Gather\Windows\SystemIndex' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows Search\Gather\Windows\SystemIndex' -Name 'RespectPowerModes' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=425; Cat="Extreme"; LabelFR="Désactiver Paging Settings"; LabelEN="Disable Paging Settings"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'DisablePagingExecutive' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'DisablePageCombining' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=426; Cat="Extreme"; LabelFR="Désactiver Service Host Splitting"; LabelEN="Disable Service Host Splitting"; Risk="safe"; Action={
    Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' |
  Where-Object { $_.Name -notmatch 'Xbl|Xbox' } |
  Foreach-Object {
    if ($null -ne (Get-ItemProperty -Path """Registry::$_""" -EA 0).Start) {
      Set-ItemProperty -Path """Registry::$_""" -Name 'SvcHostSplitDisable' -Type DWORD -Value 1 -Force -EA 0
    }
  }

}}

$Options += [PSCustomObject]@{Id=427; Cat="Extreme"; LabelFR="Optimize NTFS"; LabelEN="Optimize NTFS"; Risk="safe"; Action={
    Start-Process -FilePath 'fsutil' -ArgumentList 'behavior set disablelastaccess 1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath 'fsutil' -ArgumentList '8dot3name set 1' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
}}

$Options += [PSCustomObject]@{Id=428; Cat="Extreme"; LabelFR="Prioritize Foreground Applications"; LabelEN="Prioritize Foreground Applications"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl' -Name 'Win32PrioritySeparation' -PropertyType DWord -Value '38' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=429; Cat="Confidentialite"; LabelFR="Désactiver Publicité ID"; LabelEN="Disable Advertising ID"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo' -Name 'DisabledByGroupPolicy' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=430; Cat="Confidentialite"; LabelFR="Désactiver Sync Provider Notifications"; LabelEN="Disable Sync Provider Notifications"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=431; Cat="Confidentialite"; LabelFR="Désactiver NVIDIA Control Panel Télémétrie"; LabelEN="Disable NVIDIA Control Panel Telemetry"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\NVIDIA Corporation\NVControlPanel2\Client' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\NVIDIA Corporation\NVControlPanel2\Client' -Name 'OptInOrOutPreference' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=432; Cat="Confidentialite"; LabelFR="Désactiver Office Télémétrie"; LabelEN="Disable Office Telemetry"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Software\Policies\Microsoft\office\16.0\common' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Policies\Microsoft\office\16.0\common' -Name 'sendcustomerdata' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Policies\Microsoft\office\common\clienttelemetry' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Policies\Microsoft\office\common\clienttelemetry' -Name 'sendtelemetry' -PropertyType DWord -Value '3' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\Software\Policies\Microsoft\office\16.0\common' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Software\Policies\Microsoft\office\16.0\common' -Name 'qmenable' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=433; Cat="Confidentialite"; LabelFR="Désactiver Settings Sync"; LabelEN="Disable Settings Sync"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name 'DisableSettingSync' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name 'DisableSettingSyncUserOverride' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name 'DisableSyncOnPaidNetwork' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name 'DisableWindowsSettingSync' -PropertyType DWord -Value '2' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'SyncPolicy' -PropertyType DWord -Value '5' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=434; Cat="Confidentialite"; LabelFR="Désactiver Suggested Ways to Finish Setting Up Your Device"; LabelEN="Disable Suggested Ways to Finish Setting Up Your Device"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement' -Name 'ScoobeSystemSettingEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=435; Cat="Confidentialite"; LabelFR="Disallow Message Service Cloud Sync"; LabelEN="Disallow Message Service Cloud Sync"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging' -Name 'AllowMessageSync' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=436; Cat="Confidentialite"; LabelFR="Configure App Permissions"; LabelEN="Configure App Permissions"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics' -Name 'Value' -PropertyType String -Value 'Deny' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -PropertyType String -Value 'Deny' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation' -Name 'Value' -PropertyType String -Value 'Deny' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=437; Cat="Confidentialite"; LabelFR="Configure Windows Media Player"; LabelEN="Configure Windows Media Player"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\WMDRM' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\WMDRM' -Name 'DisableOnline' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Name 'AcceptedPrivacyStatement' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Name 'UsageTracking' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=438; Cat="Confidentialite"; LabelFR="Désactiver Activity Feed"; LabelEN="Disable Activity Feed"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableActivityFeed' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=439; Cat="Confidentialite"; LabelFR="Désactiver App Launch Tracking"; LabelEN="Disable App Launch Tracking"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_TrackProgs' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=440; Cat="Confidentialite"; LabelFR="Désactiver Device Health Attestation Monitoring and Reporting"; LabelEN="Disable Device Health Attestation Monitoring and Reporting"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService' -Name 'EnableDeviceHealthAttestationService' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=441; Cat="Confidentialite"; LabelFR="Désactiver Experimentation"; LabelEN="Disable Experimentation"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation' -Name 'Value' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=442; Cat="Confidentialite"; LabelFR="Désactiver Lockscreen Camera"; LabelEN="Disable Lockscreen Camera"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name 'NoLockScreenCamera' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=443; Cat="Confidentialite"; LabelFR="Désactiver Online Speech Recognition"; LabelEN="Disable Online Speech Recognition"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy' -Name 'HasAccepted' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=444; Cat="Confidentialite"; LabelFR="Désactiver Programme Compatibility Assistant (PCA)"; LabelEN="Disable Program Compatibility Assistant (PCA)"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'AITEnable' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableEngine' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableInventory' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisablePCA' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableUAR' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=445; Cat="Confidentialite"; LabelFR="Désactiver Performance Track"; LabelEN="Disable Performance Track"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}' -Name 'ScenarioExecutionEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=446; Cat="Confidentialite"; LabelFR="Désactiver OOBE Confidentialité Experience"; LabelEN="Disable OOBE Privacy Experience"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE' -Name 'DisablePrivacyExperience' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=447; Cat="Confidentialite"; LabelFR="Disable Recall Snapshots"; LabelEN="Disable Recall Snapshots"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'state' -PropertyType DWord -Value '%stateValue% ' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\AtlasOS\Services\' -Name 'path' -PropertyType String -Value '%scriptPath%' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI' -Name 'DisableAIDataAnalysis' -PropertyType DWord -Value '1 ' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=448; Cat="Confidentialite"; LabelFR="Désactiver Resultant Set of Policy (RSoP) Logging"; LabelEN="Disable Resultant Set of Policy (RSoP) Logging"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'RSoPLogging' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=449; Cat="Confidentialite"; LabelFR="Désactiver Automatic Mises à jour Of Speech Data"; LabelEN="Disable Automatic Updates Of Speech Data"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Speech' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Speech' -Name 'AllowSpeechModelUpdate' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=450; Cat="Confidentialite"; LabelFR="Do Not Use Diagnostic Data For Tailored Experiences"; LabelEN="Do Not Use Diagnostic Data For Tailored Experiences"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableTailoredExperiencesWithDiagnosticData' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=451; Cat="Confidentialite"; LabelFR="Désactiver Most Frequently Used Applications"; LabelEN="Disable Most Frequently Used Applications"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoInstrumentation' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=452; Cat="Confidentialite"; LabelFR="Désactiver Website Access to Language List"; LabelEN="Disable Website Access to Language List"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\Control Panel\International\User Profile' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\Control Panel\International\User Profile' -Name 'HttpAcceptLanguageOptOut' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=453; Cat="Confidentialite"; LabelFR="Désactiver Windows Error Reporting"; LabelEN="Disable Windows Error Reporting"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'Disabled' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting' -Name 'DoReport' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'Disabled' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'DontShowUI' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting' -Name 'ShowUI' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'LoggingDisabled' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'DontSendAdditionalData' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing' -Name 'DisableWerReporting' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings' -Name 'DisableSendGenericDriverNotFoundToWER' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings' -Name 'DisableSendRequestAdditionalSoftwareToWER' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=454; Cat="Confidentialite"; LabelFR="Disallow Users to Be Non-local"; LabelEN="Disallow Users to Be Non-local"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'NoConnectedUser' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=455; Cat="Confidentialite"; LabelFR="Disallow Upload and Publish of User Activities"; LabelEN="Disallow Upload and Publish of User Activities"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=456; Cat="Confidentialite"; LabelFR="Configure Search on the Barre des tâches"; LabelEN="Configure Search on the Taskbar"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BingSearchEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsAADCloudSearchEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsDeviceSearchHistoryEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsMSACloudSearchEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'SafeSearchMode' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'ConnectedSearchUseWeb' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'DisableWebSearch' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowSearchToUseLocation' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'EnableDynamicContentInWSB' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'DisableSearchBoxSuggestions' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /t REG_DWORD /v "SearchboxTaskbarMode" /d 1 /f > nul
}}

$Options += [PSCustomObject]@{Id=457; Cat="Confidentialite"; LabelFR="Désactiver Key Management Système Télémétrie"; LabelEN="Disable Key Management System Telemetry"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' -Name 'NoGenTicket' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=458; Cat="Confidentialite"; LabelFR="Désactiver Expérience client Amélioration Programme"; LabelEN="Disable Customer Experience Improvement Program"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\AppV\CEIP' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\AppV\CEIP' -Name 'CEIPEnable' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows' -Name 'CEIPEnable' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=459; Cat="Confidentialite"; LabelFR="Désactiver Diagnostic Traçage"; LabelEN="Disable Diagnostic Tracing"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance' -Name 'DisableDiagnosticTracing' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=460; Cat="Confidentialite"; LabelFR="Désactiver .NET CLI Télémétrie"; LabelEN="Disable .NET CLI Telemetry"; Risk="safe"; Action={
    setx DOTNET_CLI_TELEMETRY_OPTOUT 1
}}

$Options += [PSCustomObject]@{Id=461; Cat="Confidentialite"; LabelFR="Désactiver Saisie Télémétrie"; LabelEN="Disable Input Telemetry"; Risk="safe"; Action={
    New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\InputPersonalization' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\InputPersonalization' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' -Name 'HarvestContacts' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Personalization\Settings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Personalization\Settings' -Name 'AcceptedPrivacyPolicy' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC' -Name 'PreventHandwritingDataSharing' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' -Name 'PreventHandwritingErrorReports' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Input\Settings' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Input\Settings' -Name 'InsightsEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Input\TIPC' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Input\TIPC' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Input\TIPC' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Input\TIPC' -Name 'Enabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
}}

$Options += [PSCustomObject]@{Id=462; Cat="Confidentialite"; LabelFR="Disallow Télémétrie and Collecte de données"; LabelEN="Disallow Telemetry and Data Collection"; Risk="safe"; Action={
    Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue; Set-Service -Name 'DiagTrack' -StartupType Manual -ErrorAction SilentlyContinue
New-Item -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -PropertyType DWord -Value '1' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'MaxTelemetryAllowed' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\DataCollection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey' -Name 'EnableEventTranscript' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey' -Name 'MiniTraceSlotEnabled' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\DataCollection' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\Software\Policies\Microsoft\Windows\DataCollection' -Name 'AllowDeviceNameInTelemetry' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener' -Force -ErrorAction SilentlyContinue | Out-Null; New-ItemProperty -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener' -Name 'Start' -PropertyType DWord -Value '0' -Force -ErrorAction SilentlyContinue | Out-Null
del "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\DiagTrack*" "%ProgramData%\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\DiagTrack*" > nul 2>&1
}}
$Options += [PSCustomObject]@{Id=193; Cat="Confidentialite"; LabelFR="Interdire à TOUTES les apps l'accès aux données sensibles (contacts, position, caméra, IA générative, fichiers, notifications...)"; LabelEN="Deny ALL apps access to sensitive data (contacts, location, camera, generative AI, files, notifications...)"; Risk="moderate"; Action={
    $p = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
    $caps = @("AccountInfo","Activity","AppDiagnostics","BackgroundSpatialPerception","Bluetooth","BluetoothSync","BroadFileSystemAccess","Calendar","CallHistory","CellularData","Contacts","DocumentsLibrary","DownloadsFolder","Email","EyeTracker","GazeInput","GenerativeAi","GraphicsCaptureProgrammatic","GraphicsCaptureWithoutBorder","HumanInterfaceDevice","HumanPresence","Location","Messaging","Motion","MusicLibrary","Notifications","Phone","PicturesLibrary","Radios","SpatialPerception","Tasks","TrustedDevices","UserAccountInformation","UserDataTasks","UserNotificationListener","VideosLibrary","VoiceActivation","FileSystem","TextAndImageGeneration")
    foreach ($cap in $caps) { Set-Reg $p "LetAppsAccess$cap" 2 }
    Set-Reg $p "LetAppsRunInBackground" 2
    Set-Reg $p "LetAppsGetDiagnosticInfo" 2
}}
$Options += [PSCustomObject]@{Id=194; Cat="Confidentialite"; LabelFR="Refuser l'accès matériel bas niveau (Bluetooth, capteurs de présence, suivi du regard, casques VR)"; LabelEN="Deny low-level hardware access (Bluetooth, presence sensors, eye tracking, VR headsets)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\spatialPerception" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\backgroundSpatialPerception" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanPresence" "Value" "Deny" "String"
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice" "Value" "Deny" "String"
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" "Value" "Deny" "String"
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
    Set-Reg "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe" "BlockedOobeUpdaters" '["MS_Outlook"]' "String"
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
                    <Button Name="BtnReparateur" Tag="Reparateur" Height="32" Background="#101016" Foreground="#4ADE80" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
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
    "Reparateur"=$Form.FindName("BtnReparateur")
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
        "Reparateur" { return $L["CatReparateur"] }
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
        "Reparateur" { return "🩹" }
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

function Global:Render-Category([string]$Cat) {
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

        if ($Cat -eq "Reparateur") {
            $RepIntro = New-Object System.Windows.Controls.TextBlock
            $RepIntro.Text = if ($Global:CurrentLang -eq "FR") {
                "Actions ponctuelles de diagnostic et réparation. Chaque bouton s'exécute immédiatement, il n'y a rien à cocher."
            } else {
                "One-shot diagnostic and repair actions. Each button runs immediately, nothing to check."
            }
            $RepIntro.Foreground = Get-Brush "#A0A0A0"
            $RepIntro.FontSize = 12
            $RepIntro.TextWrapping = "Wrap"
            $RepIntro.Margin = "0,0,0,15"
            [void]$Panel.Children.Add($RepIntro)

            $repairActions = @(
                @{Id="sfc"; FR="Vérifier les fichiers système"; EN="Check system files"; DescFR="Recherche et répare les fichiers système corrompus."; DescEN="Scans for and repairs corrupted system files."; Script={ Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -WindowStyle Hidden -Wait }},
                @{Id="dism"; FR="Réparer l'image Windows"; EN="Repair Windows image"; DescFR="Répare les composants Windows endommagés (10-20 min)."; DescEN="Repairs damaged Windows components (10-20 min)."; Script={ Start-Process -FilePath "DISM.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth" -WindowStyle Hidden -Wait }},
                @{Id="explorer"; FR="Redémarrer l'explorateur"; EN="Restart Explorer"; DescFR="Ferme et relance explorer.exe sans redémarrer le PC."; DescEN="Closes and relaunches explorer.exe without rebooting."; Script={ Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 1; Start-Process explorer }},
                @{Id="icons"; FR="Reconstruire le cache d'icônes"; EN="Rebuild icon cache"; DescFR="Corrige les icônes manquantes ou incorrectes."; DescEN="Fixes missing or wrong icons."; Script={ Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue; Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache*" -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 1; Start-Process explorer }},
                @{Id="explorerreset"; FR="Réinitialiser les réglages de l'explorateur"; EN="Reset Explorer settings"; DescFR="Remet les préférences d'affichage à leur valeur par défaut."; DescEN="Restores Explorer's display preferences to default."; Script={ Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue; Remove-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Recurse -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 1; Start-Process explorer }},
                @{Id="winsock"; FR="Réinitialiser Winsock"; EN="Reset Winsock"; DescFR="Corrige les problèmes réseau après un tweak raté."; DescEN="Fixes network issues after a failed tweak."; Script={ Start-Process -FilePath "netsh" -ArgumentList "winsock reset" -WindowStyle Hidden -Wait; Start-Process -FilePath "netsh" -ArgumentList "int ip reset" -WindowStyle Hidden -Wait }},
                @{Id="wureset"; FR="Réinitialiser Windows Update"; EN="Reset Windows Update"; DescFR="Relance les services de MàJ et vide leur cache si bloqué."; DescEN="Restarts update services and clears cache if stuck."; Script={ Stop-Service -Name wuauserv,bits,cryptsvc -Force -ErrorAction SilentlyContinue; Rename-Item "$env:WINDIR\SoftwareDistribution" "SoftwareDistribution.bak" -Force -ErrorAction SilentlyContinue; Rename-Item "$env:WINDIR\System32\catroot2" "catroot2.bak" -Force -ErrorAction SilentlyContinue; Start-Service -Name wuauserv,bits,cryptsvc -ErrorAction SilentlyContinue }},
                @{Id="restorepoint"; FR="Créer un point de restauration"; EN="Create a restore point"; DescFR="Sauvegarde l'état actuel du système."; DescEN="Saves the current system state."; Script={ Enable-ComputerRestore -Drive "$env:SystemDrive\" -ErrorAction SilentlyContinue; Checkpoint-Computer -Description "Manuel OPTI-DYLAN" -RestorePointType MODIFY_SETTINGS }},
                @{Id="openrestore"; FR="Ouvrir la restauration système"; EN="Open System Restore"; DescFR="Revenir à un point de restauration antérieur."; DescEN="Go back to an earlier restore point."; Script={ Start-Process "rstrui.exe" }},
                @{Id="chkdsk"; FR="Vérifier le disque au prochain démarrage"; EN="Check disk on next boot"; DescFR="Planifie une analyse et réparation du disque."; DescEN="Schedules a disk scan and repair on restart."; Script={ cmd /c "echo Y| chkdsk $env:SystemDrive /f /r" }},
                @{Id="netstack"; FR="Réinitialiser la pile réseau"; EN="Reset network stack"; DescFR="Réinitialise TCP/IP, pare-feu et adaptateur."; DescEN="Resets TCP/IP, firewall, and network adapter."; Script={ Start-Process -FilePath "netsh" -ArgumentList "winsock reset" -WindowStyle Hidden -Wait; Start-Process -FilePath "netsh" -ArgumentList "int ip reset" -WindowStyle Hidden -Wait; ipconfig /flushdns; ipconfig /release; ipconfig /renew }},
                @{Id="searchindex"; FR="Reconstruire l'index de recherche"; EN="Rebuild search index"; DescFR="Reconstruit l'index si la recherche ne fonctionne plus."; DescEN="Rebuilds the index if Windows Search stops working."; Script={ Stop-Service -Name WSearch -Force -ErrorAction SilentlyContinue; Remove-Item "$env:ProgramData\Microsoft\Search\Data\Applications\Windows\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service -Name WSearch -ErrorAction SilentlyContinue }},
                @{Id="fileassoc"; FR="Réinitialiser les associations de fichiers"; EN="Reset file associations"; DescFR="Remet les applications par défaut à leur état d'origine."; DescEN="Restores default apps to their original state."; Script={ Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue; Remove-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts" -Recurse -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 1; Start-Process explorer }}
            )

            foreach ($ra in $repairActions) {
                $RaBox = New-Object System.Windows.Controls.Border
                $RaBox.Background = Get-Brush "#14162A"
                $RaBox.BorderBrush = Get-Brush "#2A2A3A"
                $RaBox.BorderThickness = "1"
                $RaBox.CornerRadius = "5"
                $RaBox.Padding = "12"
                $RaBox.Margin = "0,0,0,8"
                $RaGrid = New-Object System.Windows.Controls.Grid
                $ColText = New-Object System.Windows.Controls.ColumnDefinition
                $ColText.Width = "*"
                $ColBtn = New-Object System.Windows.Controls.ColumnDefinition
                $ColBtn.Width = "Auto"
                [void]$RaGrid.ColumnDefinitions.Add($ColText)
                [void]$RaGrid.ColumnDefinitions.Add($ColBtn)

                $RaTextStack = New-Object System.Windows.Controls.StackPanel
                $RaTitle = New-Object System.Windows.Controls.TextBlock
                $RaTitle.Text = if ($Global:CurrentLang -eq "FR") { $ra.FR } else { $ra.EN }
                $RaTitle.Foreground = Get-Brush "#F5F5FA"
                $RaTitle.FontWeight = "Bold"
                $RaTitle.FontSize = 13
                [void]$RaTextStack.Children.Add($RaTitle)
                $RaDesc = New-Object System.Windows.Controls.TextBlock
                $RaDesc.Text = if ($Global:CurrentLang -eq "FR") { $ra.DescFR } else { $ra.DescEN }
                $RaDesc.Foreground = Get-Brush "#8A8A9A"
                $RaDesc.FontSize = 11
                $RaDesc.TextWrapping = "Wrap"
                $RaDesc.Margin = "0,2,0,0"
                [void]$RaTextStack.Children.Add($RaDesc)
                [System.Windows.Controls.Grid]::SetColumn($RaTextStack, 0)
                [void]$RaGrid.Children.Add($RaTextStack)

                $RaBtn = New-Object System.Windows.Controls.Button
                $RaBtn.Content = if ($Global:CurrentLang -eq "FR") { "Lancer" } else { "Run" }
                $RaBtn.Height = 30
                $RaBtn.Width = 90
                $RaBtn.Background = Get-Brush "#4ADE80"
                $RaBtn.Foreground = Get-Brush "#0A0A0E"
                $RaBtn.FontWeight = "Bold"
                $RaBtn.BorderThickness = "0"
                $RaBtn.VerticalAlignment = "Center"
                $RaBtn.Tag = $ra
                $RaBtn.Add_Click({
                    $item = $this.Tag
                    $this.IsEnabled = $false
                    $originalContent = $this.Content
                    $this.Content = "..."
                    try {
                        & $item.Script
                        $LogBox.AppendText(">> [OK] $(if ($Global:CurrentLang -eq 'FR') { $item.FR } else { $item.EN })`n")
                    } catch {
                        $LogBox.AppendText(">> [ECHEC] $(if ($Global:CurrentLang -eq 'FR') { $item.FR } else { $item.EN }) -> $($_.Exception.Message)`n")
                    }
                    $LogBox.ScrollToEnd()
                    $this.Content = $originalContent
                    $this.IsEnabled = $true
                }.GetNewClosure())
                [System.Windows.Controls.Grid]::SetColumn($RaBtn, 1)
                [void]$RaGrid.Children.Add($RaBtn)

                $RaBox.Child = $RaGrid
                [void]$Panel.Children.Add($RaBox)
            }
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

            # --- Bloc Nettoyeur RAM (intervalle reglable) ---
            $RcBox = New-Object System.Windows.Controls.Border
            $RcBox.Background = Get-Brush "#14162A"
            $RcBox.BorderBrush = Get-Brush "#7C9CFF"
            $RcBox.BorderThickness = "1"
            $RcBox.CornerRadius = "5"
            $RcBox.Padding = "12"
            $RcBox.Margin = "0,0,0,15"
            $RcStack = New-Object System.Windows.Controls.StackPanel

            $RcTitle = New-Object System.Windows.Controls.TextBlock
            $isRcInstalled = Test-RamCleanerDaemonInstalled
            if ($isRcInstalled) {
                $RcTitle.Text = if ($Global:CurrentLang -eq "FR") { "✅ Nettoyeur RAM : ACTIF" } else { "✅ RAM Cleaner: ACTIVE" }
            } else {
                $RcTitle.Text = if ($Global:CurrentLang -eq "FR") { "Nettoyeur RAM : non installé" } else { "RAM Cleaner: not installed" }
            }
            $RcTitle.Foreground = Get-Brush "#7C9CFF"
            $RcTitle.FontSize = 12
            $RcTitle.FontWeight = "Bold"
            $RcTitle.Margin = "0,0,0,6"
            [void]$RcStack.Children.Add($RcTitle)

            $RcDesc = New-Object System.Windows.Controls.TextBlock
            $RcDesc.Text = if ($Global:CurrentLang -eq "FR") { "Vide le working set de tous les process (libere la RAM occupee inutilement) et purge la Standby List noyau, a l'intervalle que tu choisis ci-dessous. Meme technique que RAMMap/Mem Reduct. Change l'intervalle a tout moment, effectif immediatement, sans reinstaller." } else { "Empties the working set of every process (frees RAM held unnecessarily) and purges the kernel Standby List, at the interval you pick below. Same technique as RAMMap/Mem Reduct. Change the interval anytime, effective immediately, no reinstall needed." }
            $RcDesc.Foreground = Get-Brush "#A0A0A0"
            $RcDesc.FontSize = 11
            $RcDesc.TextWrapping = "Wrap"
            $RcDesc.Margin = "0,0,0,10"
            [void]$RcStack.Children.Add($RcDesc)

            $RcIntervalRow = New-Object System.Windows.Controls.StackPanel
            $RcIntervalRow.Orientation = "Horizontal"
            $RcIntervalRow.Margin = "0,0,0,10"

            $RcIntervalLabel = New-Object System.Windows.Controls.TextBlock
            $RcIntervalLabel.Text = if ($Global:CurrentLang -eq "FR") { "Intervalle : " } else { "Interval: " }
            $RcIntervalLabel.Foreground = Get-Brush "#F5F5FA"
            $RcIntervalLabel.VerticalAlignment = "Center"
            $RcIntervalLabel.Margin = "0,0,8,0"
            [void]$RcIntervalRow.Children.Add($RcIntervalLabel)

            $ComboRamInterval = New-Object System.Windows.Controls.ComboBox
            $ComboRamInterval.Width = 160
            $ComboRamInterval.Height = 26
            $ramIntervalOptions = @(
                @{Label = if ($Global:CurrentLang -eq "FR") { "Désactivé" } else { "Off" }; Value = 0},
                @{Label = if ($Global:CurrentLang -eq "FR") { "Toutes les 30 sec" } else { "Every 30 sec" }; Value = 30},
                @{Label = if ($Global:CurrentLang -eq "FR") { "Toutes les 1 min" } else { "Every 1 min" }; Value = 60},
                @{Label = if ($Global:CurrentLang -eq "FR") { "Toutes les 5 min" } else { "Every 5 min" }; Value = 300},
                @{Label = if ($Global:CurrentLang -eq "FR") { "Toutes les 15 min" } else { "Every 15 min" }; Value = 900},
                @{Label = if ($Global:CurrentLang -eq "FR") { "Toutes les 30 min" } else { "Every 30 min" }; Value = 1800}
            )
            $currentInterval = 300
            $existingVal = Get-ItemProperty -Path $Global:RamCleanerRegPath -Name $Global:RamCleanerRegName -ErrorAction SilentlyContinue
            if ($existingVal) { $currentInterval = $existingVal.$($Global:RamCleanerRegName) }
            foreach ($opt in $ramIntervalOptions) {
                $cbi = New-Object System.Windows.Controls.ComboBoxItem
                $cbi.Content = $opt.Label
                $cbi.Tag = $opt.Value
                [void]$ComboRamInterval.Items.Add($cbi)
                if ([int]$opt.Value -eq [int]$currentInterval) { $ComboRamInterval.SelectedItem = $cbi }
            }
            if ($null -eq $ComboRamInterval.SelectedItem -and $ComboRamInterval.Items.Count -gt 0) { $ComboRamInterval.SelectedIndex = 3 }
            $ComboRamInterval.Add_SelectionChanged({
                try {
                    $sel = $ComboRamInterval.SelectedItem
                    if ($sel) {
                        Set-RamCleanerInterval -Seconds ([int]$sel.Tag)
                        $LogBox.AppendText(">> [OK] Intervalle nettoyeur RAM -> $($sel.Content)`n")
                        $LogBox.ScrollToEnd()
                    }
                } catch { }
            })
            [void]$RcIntervalRow.Children.Add($ComboRamInterval)
            [void]$RcStack.Children.Add($RcIntervalRow)

            $RcBtnRow = New-Object System.Windows.Controls.StackPanel
            $RcBtnRow.Orientation = "Horizontal"

            $BtnInstallRc = New-Object System.Windows.Controls.Button
            $BtnInstallRc.Content = if ($Global:CurrentLang -eq "FR") { "Installer le démon" } else { "Install daemon" }
            $BtnInstallRc.Height = 28
            $BtnInstallRc.Width = 160
            $BtnInstallRc.Margin = "0,0,10,0"
            $BtnInstallRc.Background = Get-Brush "#7C9CFF"
            $BtnInstallRc.Foreground = Get-Brush "#0A0A0E"
            $BtnInstallRc.FontWeight = "Bold"
            $BtnInstallRc.BorderThickness = "0"
            $BtnInstallRc.Add_Click({
                try {
                    Install-RamCleanerDaemon
                    $LogBox.AppendText(">> [OK] Nettoyeur RAM installé et lancé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Installation Nettoyeur RAM -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Innovations"
            })
            [void]$RcBtnRow.Children.Add($BtnInstallRc)

            $BtnUninstallRc = New-Object System.Windows.Controls.Button
            $BtnUninstallRc.Content = if ($Global:CurrentLang -eq "FR") { "Désinstaller" } else { "Uninstall" }
            $BtnUninstallRc.Height = 28
            $BtnUninstallRc.Width = 120
            $BtnUninstallRc.Background = Get-Brush "#221616"
            $BtnUninstallRc.Foreground = Get-Brush "#E74C3C"
            $BtnUninstallRc.BorderThickness = "0"
            $BtnUninstallRc.Add_Click({
                try {
                    Uninstall-RamCleanerDaemon
                    $LogBox.AppendText(">> [OK] Nettoyeur RAM désinstallé`n")
                } catch {
                    $LogBox.AppendText(">> [ECHEC] Désinstallation Nettoyeur RAM -> $($_.Exception.Message)`n")
                }
                $LogBox.ScrollToEnd()
                Render-Category "Innovations"
            })
            [void]$RcBtnRow.Children.Add($BtnUninstallRc)

            [void]$RcStack.Children.Add($RcBtnRow)
            $RcBox.Child = $RcStack
            [void]$Panel.Children.Add($RcBox)
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

$Global:SearchDebounceTimer = New-Object System.Windows.Threading.DispatcherTimer
$Global:SearchDebounceTimer.Interval = [TimeSpan]::FromMilliseconds(250)
$Global:SearchDebounceTimer.Add_Tick({
    $Global:SearchDebounceTimer.Stop()
    Render-Category $Global:LastCategory
})
$TxtSearch.Add_TextChanged({
    $Global:SearchDebounceTimer.Stop()
    $Global:SearchDebounceTimer.Start()
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
    param([int[]]$OnlyIds = $null)
    # FIX "ca applique tous les tweaks de la boite" : avant, CETTE fonction
    # appliquait TOUJOURS tout ce qui etait coche dans $Global:CheckStates,
    # peu importe qui l'appelait. Si "Cocher tout (avance)" avait ete clique
    # une fois, alors le bouton "Appliquer ce niveau" du Reducteur de Processus
    # (qui appelle cette fonction en interne) republiait TOUT, pas seulement
    # les ~17 tweaks du niveau. Avec -OnlyIds, Set-ProcessReductionLevel peut
    # desormais se limiter strictement a ses propres tweaks.
    $L = $Global:LangDict[$Global:CurrentLang]
    $selected = $Options | Where-Object {
        $Global:CheckStates[$_.Id] -eq $true -and ($null -eq $OnlyIds -or $OnlyIds -contains $_.Id)
    }

    if ($selected.Count -eq 0 -and $Global:SelectedSvcHostValue -eq "380000") {
        [System.Windows.MessageBox]::Show($L["NoOption"], "OPTI-DYLAN")
        return
    }

    # SECURITE : confirmation explicite si des tweaks a risque sont dans la
    # selection. On ne bloque jamais silencieusement, mais on force a lire.
    $riskyCount = ($selected | Where-Object { $_.Risk -eq "moderate" -or $_.Risk -eq "risky" }).Count
    if ($riskyCount -gt 0) {
        $riskMsg = if ($Global:CurrentLang -eq "FR") {
            "$riskyCount tweak(s) sur $($selected.Count) sont marques a risque modere/eleve (services systeme, fichiers, tâches critiques touchees).`n`nUn point de restauration va etre cree automatiquement avant application. Continuer ?"
        } else {
            "$riskyCount of $($selected.Count) tweaks are flagged moderate/high risk (touch system services, files, or critical tasks).`n`nA restore point will be created automatically before applying. Continue?"
        }
        $confirm = [System.Windows.MessageBox]::Show($riskMsg, "OPTI-DYLAN", [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Warning)
        if ($confirm -ne "Yes") { return }
    }

    # SECURITE : point de restauration automatique, une seule fois par session,
    # AVANT que le moindre tweak ne soit applique. Ne bloque pas l'application
    # si la creation echoue (ex: protection systeme desactivee par l'utilisateur
    # sur ce disque), mais previent clairement dans le log au lieu de continuer
    # en silence.
    if (-not $Global:RestorePointCreatedThisSession) {
        $LogBox.AppendText(">> [SYSTEM] Création du point de restauration avant application...`n")
        $LogBox.ScrollToEnd()
        try {
            Enable-ComputerRestore -Drive "$env:SystemDrive\" -ErrorAction SilentlyContinue
            Checkpoint-Computer -Description "Avant OPTI-DYLAN" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
            $Global:RestorePointCreatedThisSession = $true
            $LogBox.AppendText(">> [OK] Point de restauration créé.`n")
        } catch {
            $LogBox.AppendText(">> [ATTENTION] Point de restauration NON créé ($($_.Exception.Message)). Tu peux continuer, mais sans filet en cas de souci.`n")
            $proceedAnyway = [System.Windows.MessageBox]::Show(
                $(if ($Global:CurrentLang -eq "FR") { "Le point de restauration a échoué. Continuer quand même sans filet de sécurité ?" } else { "Restore point creation failed. Continue anyway without a safety net?" }),
                "OPTI-DYLAN", [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Warning)
            if ($proceedAnyway -ne "Yes") { return }
        }
        $LogBox.ScrollToEnd()
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
