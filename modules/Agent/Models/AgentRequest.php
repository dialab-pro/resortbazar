<?php
namespace Modules\Agent\Models;

use App\BaseModel;
use App\User;
use Illuminate\Database\Eloquent\SoftDeletes;
use Modules\User\Models\Role;

class AgentRequest extends BaseModel
{
    use SoftDeletes;
    protected $table = 'user_upgrade_request';
    protected $fillable = [
        'user_id',
        'approved_time',
        'role_request',
        'status',
        'approved_time',
        'approved_by'
    ];

    public static function getModelName()
    {
        return __("User upgrade request");
    }
    public function user(){
        return $this->belongsTo(User::class)->withDefault();
    }
    public function approvedBy(){
        return $this->belongsTo(User::class,'approved_by')->withDefault();
    }
    public function role(){
        return $this->belongsTo(Role::class,'role_request')->withDefault();;
    }
}
