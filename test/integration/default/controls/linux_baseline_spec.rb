skip_linux_baseline_controls = [
    'os-05',
    'os-05b',
    'os-06',
    'os-10',
    'package-07',
    'package-08',
    'sysctl-05',
    'sysctl-06',
    'sysctl-07',
    'sysctl-08',
    'sysctl-09',
    'sysctl-10',
    'sysctl-15',
    'sysctl-16',
    'sysctl-17',
    'sysctl-20',
    'sysctl-21',
    'sysctl-22',
    'sysctl-23',
    'sysctl-24',
    'sysctl-25',
    'sysctl-26',
    'sysctl-27',
    'sysctl-28',
    'sysctl-30',
]

include_controls 'linux-baseline' do
    skip_linux_baseline_controls.each do|x|
       skip_control x
    end
end
