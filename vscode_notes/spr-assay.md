# spr

spr run can have at most 8 antigens and can handle 3 384 well plates

customer submits 10 seqs, 3 reserved wells for controls


runs up to 3 antigen on a plate, recent discussions maybe have more?




8 different antigens as part of that assay then you should have 8 different positive controls on that antibody plate somewhere and 1 negative control (not 8), and a buffer (blank)

10 on a 384 not 96


if you were to have only 1 positive control that only applies to 1 antigen.



can assign custom positive controls and we will run positive twist control or none.

there are a number of antigens that don't have a positive control for them


example ads spr request:

{
  "mode": "v1",
  "set_id": "SET_001",
  "container_barcode": "pPAI_2605010003",
  "site": "SITE_456",
  "s3_file_location": "https://maestro-uploads.twistbioscience-staging.com/fb3fe01b-2f93-496a-9fdc-f2c2475d6545/3cbdd179-57fd-48b7-8f5e-4acff022a372/ASERV-111FOLR1pSPRRawData-2026-05-08T22-01-55.xlsx",
  "assay_conditions": {
    "assay_temperature": "25",
    "assay_buffer": "HBSTE_BSA",
    "capture_surface": "anti-human Fc",
    "association_time": "300",
    "dissociation_time": "600"
  },
  "concentration_parameters": {
    "target_volume_ul": 100.0,
    "transfer_volume_ul": 10.0,
    "analyte_starting_concentration": 2000.0,
    "serial_dilution_ratio": 3.0,
    "num_serial_dilutions": 6,
    "hbs_et_volume_fraction": 0.6,
    "ligand_mw_kda": 148.0
  },
  "antigens": [
    {"antigen_id": "FOLR1", "mw_kda": 26.5},
    {"antigen_id": "CLEC12A", "mw_kda": 25.6}
  ]
}