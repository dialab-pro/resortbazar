<?php
namespace Modules\Agent\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithMapping;
use Modules\User\Models\Subscriber;
use Maatwebsite\Excel\Concerns\WithHeadings;

class SubscriberExport implements FromCollection, WithHeadings, WithMapping
{
    use Exportable;

    public function collection()
    {
        return Subscriber::select([
            'email',
            'first_name',
            'last_name'
        ])->get();
    }

    /**
     * @var Subscriber $subscriber
     * @return array
     */
    public function map($subscriber): array
    {
        return [
            ltrim($subscriber->email,"=-"),
            ltrim($subscriber->first_name,"=-"),
            ltrim($subscriber->last_name,"=-"),
        ];
    }

    public function headings(): array
    {
        return [
            'Email',
            'First name',
            'Last name',
        ];
    }
}
