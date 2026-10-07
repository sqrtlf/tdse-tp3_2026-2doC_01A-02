{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "system_setup_menu Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\ninterface:\n    // Eventos generados por los botones físicos\n    in event btnEnter\n    in event btnNext\n    in event btnEscape\n\ninternal:\n    // Variables para guardar los parámetros de cada motor\n    var m1_power: boolean = true   // true: ON, false: OFF\n    var m1_speed: integer = 8          // Rango 0 a 9\n    var m1_spin: boolean = false   // false: LEFT (L), true: RIGHT (R)\n\n    var m2_power: boolean = true\n    var m2_speed: integer = 8\n    var m2_spin: boolean = false"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -82,
          "y": -305
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MAIN",
            "fontSize": 11
          }
        },
        "id": "18f4904a-f9dc-4810-b4c8-a9d8144ec767",
        "z": 50
      },
      {
        "position": {
          "x": -166,
          "y": -12
        },
        "size": {
          "height": 65,
          "width": 117
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_LEFT",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_spin= false"
          }
        },
        "id": "823fd7e9-f6c3-4b36-aef0-050ce9bd7e1e",
        "z": 57
      },
      {
        "position": {
          "x": -558,
          "y": -107
        },
        "size": {
          "height": 60,
          "width": 104
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M2_M1_POWER",
            "fontSize": 11
          }
        },
        "id": "21f90338-5eec-4c63-90df-a844513a5f49",
        "z": 70
      },
      {
        "position": {
          "x": -319,
          "y": -109
        },
        "size": {
          "height": 60,
          "width": 99
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M2_M1_SPEED",
            "fontSize": 11
          }
        },
        "id": "c9b73756-5254-499a-a3a6-929a19ff1deb",
        "z": 72
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "21f90338-5eec-4c63-90df-a844513a5f49"
        },
        "target": {
          "id": "c9b73756-5254-499a-a3a6-929a19ff1deb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.061%",
              "dy": "60%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f75a1749-3665-488a-a69f-13874d8d5a65",
        "z": 73,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -152,
          "y": -109
        },
        "size": {
          "height": 60,
          "width": 107
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M2_M1_SPIN",
            "fontSize": 11
          }
        },
        "id": "eb6f80c5-5349-49e5-b4bd-adea73d58503",
        "z": 77
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9b73756-5254-499a-a3a6-929a19ff1deb"
        },
        "target": {
          "id": "eb6f80c5-5349-49e5-b4bd-adea73d58503",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "46.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "077a69f6-72ba-4b98-9c73-5e750aaa4d7b",
        "z": 78,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "eb6f80c5-5349-49e5-b4bd-adea73d58503"
        },
        "target": {
          "id": "21f90338-5eec-4c63-90df-a844513a5f49",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.098%",
              "dy": "51.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.49107716996286704,
              "offset": 8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "67817d31-6498-41e9-8c06-fb50a9de712f",
        "z": 79,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -249,
            "y": -25
          }
        ]
      },
      {
        "position": {
          "x": -311,
          "y": -8
        },
        "size": {
          "height": 60,
          "width": 113
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_SPD0",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_speed = 0"
          }
        },
        "id": "5e6e63ef-53bc-4a19-97b9-c38ef10b0a2a",
        "z": 84
      },
      {
        "position": {
          "x": -306,
          "y": 256
        },
        "size": {
          "height": 60,
          "width": 139
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_SPD9",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_speed = 9"
          }
        },
        "id": "dbe2f960-98db-41a0-85ab-00151cf78b7e",
        "z": 85
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "dbe2f960-98db-41a0-85ab-00151cf78b7e"
        },
        "target": {
          "id": "5e6e63ef-53bc-4a19-97b9-c38ef10b0a2a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48.343%",
              "dy": "8.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.5546190407738675,
              "offset": -29,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f62f5082-5535-4f79-afe4-72c91706acf1",
        "z": 91,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -352,
            "y": 249
          },
          {
            "x": -352,
            "y": 122
          }
        ]
      },
      {
        "position": {
          "x": -167,
          "y": 133
        },
        "size": {
          "height": 63,
          "width": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_RIGHT",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_spin = true"
          }
        },
        "id": "3926c6d9-53af-458b-83c3-650d03fb637a",
        "z": 92
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3926c6d9-53af-458b-83c3-650d03fb637a"
        },
        "target": {
          "id": "823fd7e9-f6c3-4b36-aef0-050ce9bd7e1e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "69.648%",
              "dy": "91.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "offset": 22,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9b0b2430-be6a-4ee8-89c0-67bac3a44fe7",
        "z": 93,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "823fd7e9-f6c3-4b36-aef0-050ce9bd7e1e"
        },
        "target": {
          "id": "3926c6d9-53af-458b-83c3-650d03fb637a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "24.39%",
              "dy": "8.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.4647058823529412,
              "offset": 29,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ebbe78d2-2fb5-469a-8a17-6060595f57a1",
        "z": 94,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -372,
          "y": -244
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M1_MOTOR1",
            "fontSize": 11
          }
        },
        "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f",
        "z": 99
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "18f4904a-f9dc-4810-b4c8-a9d8144ec767"
        },
        "target": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "37.573%",
              "dy": "3.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.5634340035494917,
              "offset": 11,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ed9026e7-3a9b-4571-8a4d-a03ea7e0ec67",
        "z": 100,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f"
        },
        "target": {
          "id": "18f4904a-f9dc-4810-b4c8-a9d8144ec767",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "45%",
              "dy": "70%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {
              "distance": 0.5216358195690431,
              "offset": 16.559112548828125,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9e375124-22c3-42eb-a0f3-b4328958c657",
        "z": 100,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -245,
            "y": -249
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f"
        },
        "target": {
          "id": "21f90338-5eec-4c63-90df-a844513a5f49",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "53.862%",
              "dy": "1.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.30692299993777583,
              "offset": -17.884689331054688,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "cd871f7d-ded6-4884-9355-0b010b3d36bc",
        "z": 103,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "21f90338-5eec-4c63-90df-a844513a5f49"
        },
        "target": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "36.399%",
              "dy": "96.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1deb785c-be5a-4f83-bf9b-622bf44b5617",
        "z": 107,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -384,
            "y": -131
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9b73756-5254-499a-a3a6-929a19ff1deb"
        },
        "target": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "62.231%",
              "dy": "98.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {
              "distance": 0.4066666666666667,
              "offset": 31,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "de315918-6c0d-4aab-b8ad-f5fb23532ffa",
        "z": 108,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "eb6f80c5-5349-49e5-b4bd-adea73d58503"
        },
        "target": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.798%",
              "dy": "96.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {
              "distance": 0.41710226212009643,
              "offset": 10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7c324628-f03a-4149-ab9d-0e69a4173d1a",
        "z": 109,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -146,
            "y": -158
          },
          {
            "x": -249,
            "y": -158
          }
        ]
      },
      {
        "position": {
          "x": -653,
          "y": 0
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_power = true"
          }
        },
        "id": "c7910fcd-e36b-4e8b-a299-65eb94f7251f",
        "z": 112
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "21f90338-5eec-4c63-90df-a844513a5f49"
        },
        "target": {
          "id": "c7910fcd-e36b-4e8b-a299-65eb94f7251f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "46.282%",
              "dy": "10%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.47995611003491206,
              "offset": -30,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f54c61e1-b90f-49f5-a777-bf99ba5bfcf6",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -625,
            "y": -30
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5e6e63ef-53bc-4a19-97b9-c38ef10b0a2a"
        },
        "target": {
          "id": "c9b73756-5254-499a-a3a6-929a19ff1deb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "53.535%",
              "dy": "93.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {
              "distance": 0.15853658536585366,
              "offset": -29,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f0252cb5-9fdb-4638-95eb-1a2697c387a2",
        "z": 125,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9b73756-5254-499a-a3a6-929a19ff1deb"
        },
        "target": {
          "id": "5e6e63ef-53bc-4a19-97b9-c38ef10b0a2a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "66.372%",
              "dy": "35%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.32926829268292684,
              "offset": -29,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "33df1583-9073-4134-a659-ff85b50b905d",
        "z": 126,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "823fd7e9-f6c3-4b36-aef0-050ce9bd7e1e"
        },
        "target": {
          "id": "eb6f80c5-5349-49e5-b4bd-adea73d58503",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "28.037%",
              "dy": "80%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {
              "distance": 0.4318394392901412,
              "offset": 9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "05fb041c-67b7-498e-af6b-54d1db5414a9",
        "z": 127,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -62,
            "y": -22
          },
          {
            "x": -101,
            "y": -22
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "eb6f80c5-5349-49e5-b4bd-adea73d58503"
        },
        "target": {
          "id": "823fd7e9-f6c3-4b36-aef0-050ce9bd7e1e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "55.769%",
              "dy": "11.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.2770727892547721,
              "offset": -9.115310668945312,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "af5e1d28-4c13-49cf-ad24-3c07d1a1ed06",
        "z": 128,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 345,
          "y": -226
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M1_MOTOR2",
            "fontSize": 11
          }
        },
        "id": "7d814ca3-4f83-4f7e-8e08-661d389eb757",
        "z": 129
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f"
        },
        "target": {
          "id": "7d814ca3-4f83-4f7e-8e08-661d389eb757",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "60%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.47191306774031055,
              "offset": 10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "87fd3492-b512-45f8-91d6-1d7f098adc82",
        "z": 130,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7d814ca3-4f83-4f7e-8e08-661d389eb757"
        },
        "target": {
          "id": "08a388cd-cc40-4c5b-8a72-f0d6271f561f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.804%",
              "dy": "16.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext\n"
              }
            },
            "position": {
              "distance": 0.5004966913683812,
              "offset": -1,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b4694881-9a22-4834-acf6-823cc38bbe3b",
        "z": 130,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -199,
            "y": -201
          }
        ]
      },
      {
        "position": {
          "x": 638,
          "y": -131
        },
        "size": {
          "height": 60,
          "width": 109
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M2_M2_SPIN",
            "fontSize": 11
          }
        },
        "id": "9f7e49b8-e290-4ec3-92f7-14454c87711d",
        "z": 131
      },
      {
        "position": {
          "x": 332,
          "y": -125
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M2_M2_SPEED",
            "fontSize": 11
          }
        },
        "id": "41950073-cc33-423b-a8fb-7c9614c0e0cd",
        "z": 132
      },
      {
        "position": {
          "x": 151,
          "y": -123
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M2_M2_POWER",
            "fontSize": 11
          }
        },
        "id": "938034c2-4008-47c6-9994-ccd050e2fa13",
        "z": 133,
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7d814ca3-4f83-4f7e-8e08-661d389eb757"
        },
        "target": {
          "id": "938034c2-4008-47c6-9994-ccd050e2fa13",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "44.715%",
              "dy": "10%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.45334924962341056,
              "offset": -8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "fb6c3f9d-cb81-4b69-8ca1-b2821ac7146e",
        "z": 134,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 50,
            "y": -177
          }
        ]
      },
      {
        "position": {
          "x": 330,
          "y": -31
        },
        "size": {
          "height": 60,
          "width": 194
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_SPD0",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_speed = 0"
          }
        },
        "id": "c60e22a4-b667-4336-9f3b-b1ce92cf0a0b",
        "z": 139
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "938034c2-4008-47c6-9994-ccd050e2fa13"
        },
        "target": {
          "id": "41950073-cc33-423b-a8fb-7c9614c0e0cd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.333%",
              "dy": "56.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "239084a3-2d24-47f4-b189-9689649b2320",
        "z": 145,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "41950073-cc33-423b-a8fb-7c9614c0e0cd"
        },
        "target": {
          "id": "9f7e49b8-e290-4ec3-92f7-14454c87711d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.587%",
              "dy": "55%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ff698376-85a5-45d6-89ea-83d62e803a4c",
        "z": 146,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -608,
          "y": 171
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_power = false"
          }
        },
        "id": "fe452e77-129d-4e4d-8a83-0503e00b6614",
        "z": 149
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fe452e77-129d-4e4d-8a83-0503e00b6614"
        },
        "target": {
          "id": "c7910fcd-e36b-4e8b-a299-65eb94f7251f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "75.852%",
              "dy": "96.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.4764705882352941,
              "offset": 25,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e7caa9ae-23a4-47ed-a75c-50b1726df6b8",
        "z": 150,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c7910fcd-e36b-4e8b-a299-65eb94f7251f"
        },
        "target": {
          "id": "fe452e77-129d-4e4d-8a83-0503e00b6614",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "16.435%",
              "dy": "33.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "offset": -23,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "191f48cc-f8b5-4921-bfd5-ab0470fdd130",
        "z": 151,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 93,
          "y": -29
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_power = true"
          }
        },
        "id": "950692ec-0e62-4ae9-8886-49fc63f8b99b",
        "z": 156
      },
      {
        "position": {
          "x": 89,
          "y": 135
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_power = false"
          }
        },
        "id": "d1099d50-557a-4b65-afe2-7615b3917f03",
        "z": 158
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "950692ec-0e62-4ae9-8886-49fc63f8b99b"
        },
        "target": {
          "id": "d1099d50-557a-4b65-afe2-7615b3917f03",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "55.056%",
              "dy": "1.639%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.40476190476190477,
              "offset": 26,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "8993f64b-2598-4996-bfad-29a57b8ab514",
        "z": 159,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "d1099d50-557a-4b65-afe2-7615b3917f03"
        },
        "target": {
          "id": "950692ec-0e62-4ae9-8886-49fc63f8b99b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "80.233%",
              "dy": "83.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.5476190476190477,
              "offset": 34,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "79b4bef3-3730-40e3-a0bb-9d42270bdca5",
        "z": 159,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9f7e49b8-e290-4ec3-92f7-14454c87711d"
        },
        "target": {
          "id": "938034c2-4008-47c6-9994-ccd050e2fa13",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "13.333%",
              "dy": "51.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.4938034218781589,
              "offset": 6,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d9fa0960-e0a4-43ee-94a4-c6a77b2f3a45",
        "z": 160,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 159,
            "y": -46
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "938034c2-4008-47c6-9994-ccd050e2fa13"
        },
        "target": {
          "id": "950692ec-0e62-4ae9-8886-49fc63f8b99b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.567%",
              "dy": "55%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.4324876829268649,
              "offset": 30.19675792042077,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a9864757-2a2b-47e2-89e9-b93af9d21764",
        "z": 161,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "950692ec-0e62-4ae9-8886-49fc63f8b99b"
        },
        "target": {
          "id": "938034c2-4008-47c6-9994-ccd050e2fa13",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "53.333%",
              "dy": "88.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {
              "distance": 0.4907888391239368,
              "offset": -43,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "06ba588a-80e8-4920-ad17-970eaea8be22",
        "z": 162,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 55,
            "y": 81
          }
        ]
      },
      {
        "position": {
          "x": 329,
          "y": 226
        },
        "size": {
          "height": 60,
          "width": 201
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_SPD9",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_speed = 9"
          }
        },
        "id": "4143bc62-a062-45ce-b428-f61ab21a47a3",
        "z": 164
      },
      {
        "position": {
          "x": 331,
          "y": 115
        },
        "size": {
          "height": 64,
          "width": 197
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_SPD1_8",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_speed = (m2_speed == 0 || m2_speed >= 9) ? 1 : ((m2_speed < 8) ? m2_speed + 1 : 8)"
          }
        },
        "id": "0aa40340-b738-4e2a-b520-f518e8c0829d",
        "z": 165
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c60e22a4-b667-4336-9f3b-b1ce92cf0a0b"
        },
        "target": {
          "id": "0aa40340-b738-4e2a-b520-f518e8c0829d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "58.333%",
              "dy": "8.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "offset": -22.00001342773436,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "791eb185-adbd-49c0-b6f4-34fca5c6ef2a",
        "z": 166,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 658,
          "y": 113
        },
        "size": {
          "height": 74,
          "width": 171
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_RIGHT",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_spin= true"
          }
        },
        "id": "1d14f326-49f9-4f41-8426-bac4a296f676",
        "z": 167
      },
      {
        "position": {
          "x": 661,
          "y": -19
        },
        "size": {
          "height": 64,
          "width": 162
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M2_LEFT",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m2_spin= false"
          }
        },
        "id": "4a766a10-71ff-45bb-b494-4a147e0613b8",
        "z": 168
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4a766a10-71ff-45bb-b494-4a147e0613b8"
        },
        "target": {
          "id": "9f7e49b8-e290-4ec3-92f7-14454c87711d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
              "dy": "45%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "49dc79b6-11e4-4fdd-8150-e3d3813b87ed",
        "z": 169,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9f7e49b8-e290-4ec3-92f7-14454c87711d"
        },
        "target": {
          "id": "4a766a10-71ff-45bb-b494-4a147e0613b8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.383%",
              "dy": "60.938%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.5147582357241947,
              "offset": -38.95901895707078,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a1bb68d2-65e1-48a4-97bf-1a3d27fc45e4",
        "z": 170,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4a766a10-71ff-45bb-b494-4a147e0613b8"
        },
        "target": {
          "id": "1d14f326-49f9-4f41-8426-bac4a296f676",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "25.731%",
              "dy": "17.568%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.5294117647058824,
              "offset": 27,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "06243209-1ff6-40cb-ba9a-98d0a31c75ff",
        "z": 171,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1d14f326-49f9-4f41-8426-bac4a296f676"
        },
        "target": {
          "id": "4a766a10-71ff-45bb-b494-4a147e0613b8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "69.753%",
              "dy": "90.625%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.5441176470588235,
              "offset": 30,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4e58cabe-db99-4531-97bd-78f7d725309a",
        "z": 172,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0aa40340-b738-4e2a-b520-f518e8c0829d"
        },
        "target": {
          "id": "4143bc62-a062-45ce-b428-f61ab21a47a3",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "68.159%",
              "dy": "31.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.5212765957446809,
              "offset": -36,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7818162d-0d78-4d0e-af88-3fd334ed6857",
        "z": 173,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "41950073-cc33-423b-a8fb-7c9614c0e0cd"
        },
        "target": {
          "id": "c60e22a4-b667-4336-9f3b-b1ce92cf0a0b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "61.34%",
              "dy": "18.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEnter"
              }
            },
            "position": {
              "distance": 0.49680233643890986,
              "offset": -32.869416643677646,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "abc9c749-9380-4f7e-97a6-8cb7636a9459",
        "z": 176,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c60e22a4-b667-4336-9f3b-b1ce92cf0a0b"
        },
        "target": {
          "id": "41950073-cc33-423b-a8fb-7c9614c0e0cd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "41.667%",
              "dy": "76.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "25c170cd-49f7-45df-9f02-afef81b253e2",
        "z": 177,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -61,
          "y": -391
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "8dd03474-0ea4-4d41-b0f4-6ce9f8c11e1c",
        "z": 178,
        "embeds": [
          "f5f6b41b-7747-4a71-9c8c-d458d105aa26"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -61,
          "y": -376
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "f5f6b41b-7747-4a71-9c8c-d458d105aa26",
        "z": 179,
        "parent": "8dd03474-0ea4-4d41-b0f4-6ce9f8c11e1c"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8dd03474-0ea4-4d41-b0f4-6ce9f8c11e1c"
        },
        "target": {
          "id": "18f4904a-f9dc-4810-b4c8-a9d8144ec767",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "35%",
              "dy": "58.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4ab92e88-882d-4f0d-a723-c470dd246577",
        "z": 180,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c7910fcd-e36b-4e8b-a299-65eb94f7251f"
        },
        "target": {
          "id": "21f90338-5eec-4c63-90df-a844513a5f49",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "63.462%",
              "dy": "75%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "3c722575-e0ac-4736-8c2a-4c5c6d0ff1e8",
        "z": 181,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4143bc62-a062-45ce-b428-f61ab21a47a3"
        },
        "target": {
          "id": "c60e22a4-b667-4336-9f3b-b1ce92cf0a0b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "81.959%",
              "dy": "55%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.4929488290535965,
              "offset": -36,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "96998598-d307-4f36-b46d-0b283b5aee66",
        "z": 182,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 619,
            "y": 251
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "938034c2-4008-47c6-9994-ccd050e2fa13"
        },
        "target": {
          "id": "7d814ca3-4f83-4f7e-8e08-661d389eb757",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "89.429%",
              "dy": "51.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnEscape"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "bfb3c7b9-3df6-4af9-8447-244832f424bc",
        "z": 184,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 276,
            "y": -255
          }
        ]
      },
      {
        "position": {
          "x": -306,
          "y": 127
        },
        "size": {
          "height": 62,
          "width": 114
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_M3_M1_SPD1_8",
            "fontSize": 11
          },
          "specification": {
            "text": "btnEnter / m1_speed = (m1_speed == 0 || m1_speed >= 9) ? 1 : ((m1_speed < 8) ? m1_speed + 1 : 8)"
          }
        },
        "id": "9ea35104-0c6f-466f-b11f-a556a046b783",
        "z": 187,
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5e6e63ef-53bc-4a19-97b9-c38ef10b0a2a"
        },
        "target": {
          "id": "9ea35104-0c6f-466f-b11f-a556a046b783",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "23.981%",
              "dy": "10%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.5133333333333333,
              "offset": 29,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "498333bd-5bce-4f4b-b10e-94b6d63f5fb4",
        "z": 188,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9ea35104-0c6f-466f-b11f-a556a046b783"
        },
        "target": {
          "id": "dbe2f960-98db-41a0-85ab-00151cf78b7e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "20.875%",
              "dy": "1.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "distance": 0.47101449275362317,
              "offset": 26,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "651889d9-2e15-4ee6-9be1-10aaf0133503",
        "z": 188,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9ea35104-0c6f-466f-b11f-a556a046b783"
        },
        "target": {
          "id": "5e6e63ef-53bc-4a19-97b9-c38ef10b0a2a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "64.823%",
              "dy": "95%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "btnNext"
              }
            },
            "position": {
              "offset": 26,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "60755d4e-605c-4ff6-9199-cbfe6e0a5679",
        "z": 188,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SystemSetupMenu",
          "statemachinePrefix": "systemSetupMenu",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}