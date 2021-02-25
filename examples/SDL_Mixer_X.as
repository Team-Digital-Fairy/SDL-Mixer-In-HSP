#ifdef __hsp30__
#ifndef __SDLMIXER__
#define global __SDLMIXER__
#uselib "SDL2_mixer_ext.dll"
	; SDL_Mixer_EXTを使うことにした。
	#cfunc Mix_Linked_Version "Mix_Linked_Version"

	;初期化関連
	#cfunc Mix_Init "Mix_Init" int ;本当はSDLと共に初期化したほうがいいんだけど、いらない・・・？
	#cfunc Mix_Quit "Mix_Quit"
	#cfunc Mix_OpenAudio "Mix_OpenAudio" int,int,int,int ; Mixerを指定したオーディオフォーマットで開く
	;int SDLCALL Mix_OpenAudioDevice(int frequency, Uint16 format, int channels, int chunksize, const char* device, int allowed_changes);
	#cfunc Mix_CloseAudio "Mix_CloseAudio"
	#cfunc Mix_QuerySpec "Mix_QuerySpec" var,var,var ;SpecQuery
	
	;#cfunc Mix_GetError "Mix_GetError" ; String PTR返される。注意
	;曲再生関連
	#cfunc Mix_LoadMUS "Mix_LoadMUS" sptr ;Path指定でロード。
	#cfunc Mix_LoadMUS_RW "Mix_LoadMUS_RW" int,int ; RWopsを使ってMUSをロード。
	
	#cfunc Mix_FreeMusic "Mix_FreeMusic" int ;ロードしたミュージックを開放する。
	#cfunc Mix_PlayMusic "Mix_PlayMusic" int,int ;Musicを再生。 Mix_Music, loops (-1で無限)
	#cfunc Mix_PlayChannelTimedVolume "Mix_PlayChannelTimedVolume" int,int,int,int,int ;音量設定+長さリミット付きで再生。 ;MIXER-Xオンリー
	#define ctype Mix_PlayChannelVol(%1,%2,%3,%4) Mix_PlayChannelTimedVolume(%1,%2,%3,-1,%4) ;長さリミットなし+音量設定あり
	

	#cfunc Mix_PlayingMusic "Mix_PlayingMusic" ;Mix_Music再生してる? 1ならYes

	#cfunc global Mix_Playing "Mix_Playing" int

	#cfunc Mix_Pause "Mix_Pause" int; チャンネルをポーズする channel
	#cfunc Mix_Resume "Mix_Resume" int; チャンネルをレジュームする。channel
	#cfunc Mix_Paused "Mix_Paused" int;ポーズしている？ channel

	#cfunc Mix_FadeOutMusicStream "Mix_FadeOutMusicStream" int,int 

	;#cfunc Mix_PauseMusic "Mix_PauseMusic" ;曲をポーズする。
	;#cfunc Mix_ResumeMusic "Mix_ResumeMusic" ;曲を再開する。
	;#cfunc Mix_RewindMusic "Mix_RewindMusic" ;曲を巻き戻しする。
	;#cfunc Mix_PausedMusic "Mix_PausedMusic" ;今ポーズしている？
	#cfunc Mix_PauseMusicStream "Mix_PauseMusicStream" int ;曲をポーズする。 Mix_Music
	#cfunc Mix_ResumeMusicStream "Mix_ResumeMusicStream" int ;曲を再開する。 Mix_Music
	#cfunc Mix_RewindMusicStream "Mix_RewindMusicStream" int ;曲を巻き戻しする。 Mix_Music
	#cfunc Mix_PausedMusicStream "Mix_PausedMusicStream" int ;今ポーズしている？ Mix_Music

	#cfunc Mix_SetMusicStreamPosition "Mix_SetMusicStreamPosition" int,double ;今のMix_Musicの再生位置を指定 Mix_Music, position
	;#cfunc Mix_SetMusicPosition "Mix_SetMusicPosition" double;曲の位置指定。 position ;エラーなら-1が返ってくる。
	#cfunc Mix_GetMusicPosition "Mix_GetMusicPosition" int; 曲の長さを取得。 Mix_Music ;doubleでposが返ってくる。

	#cfunc Mix_GetMusicTotalTime "Mix_GetMusicTotalTime" int ;曲の長さを取得
	#cfunc Mix_GetMusicLoopStartTime "Mix_GetMusicLoopStartTime" int ;ループポイントを始まりを取得 Mix_Music
	#cfunc Mix_GetMusicLoopEndTime "Mix_GetMusicLoopEndTime" int;ループポイントの終わりを取得 Mix_Music
	#cfunc Mix_GetMusicLoopLengthTime "Mix_GetMusicLoopLengthTime" int ;Loop長さを取得 Mix_Music

	#cfunc Mix_SetMusicTempo "Mix_SetMusicTempo" int, double;テンポの割合を設定 Mix_Music, position
	#cfunc Mix_GetMusicTempo "Mix_GetMusicTempo" int ;テンポの割合を取得 Mix_Music 
	
	; Volumeは0-128の範囲。
	#cfunc Mix_Volume "Mix_Volume" int, int ;チャンネル単位のボリューム指定 channel, volume.
	#cfunc Mix_VolumeChunk "Mix_VolumeChunk" int,int ;チャンク指定のボリューム設定 chunk, volume
	#cfunc Mix_VolumeMusic "Mix_VolumeMusic" int ;今再生してるボリュームを変える。　・・・動作わからん。
	#cfunc Mix_GetVolumeMusicStream "Mix_GetVolumeMusicStream" int;今再生してるMixMusicのボリュームを取得 Mix_Music

	#cfunc Mix_HaltChannel "Mix_HaltChannel" int ;channel チャンネル単位で止める。
	#cfunc Mix_HaltGroup "Mix_HaltGroup" int ;グループ単位で止める
	#cfunc Mix_HaltMusic "Mix_HaltMusic"; すべてのMusic停止。
	#cfunc Mix_ExpireChannel "Mix_ExpireChannel" int,int;何秒後に停止。channel,ticks
	;サンプル関連 Mix_Chunkを扱う系列
	#cfunc Mix_GetNumChunkDecoders "Mix_GetChunkDecoders" ;int返す
	#cfunc Mix_GetChunkDecoder "Mix_GetChunkDecoder" int ;String PTR
	#cfunc Mix_LoadWAV_RW "Mix_LoadWAV_RW" int,int ; Chunk生成
	;#cfunc Mix_LoadWAV "Mix_LoadWAV" sptr ;ファイルネーム
	#cfunc Mix_QuickLoad_WAV "Mix_QuickLoad_WAV" int ;もしすでにメモリにロードした場合。PTRを受け取る
	#cfunc Mix_FreeChunk "Mix_FreeChunk" int ; MixChunk PTR。再生中にFREEすると事故るよ。
	
	; フィルタ関連。
	#cfunc Mix_SetPanning "Mix_SetPanning" int,int,int ;channel, left, right パンをchannelに設定
	#cfunc Mix_SetPosition "Mix_SetPosition" int, int, int ;channel, angle, distance 角度と距離指定での深度効果
	#cfunc Mix_SetDistance "Mix_SetDistance" int, int ;channel, distance　距離指定での深度効果
	;#cfunc Mix_SetReverb "Mix_SetReverb" int, int ; channel, echo リバーブを指定
	#cfunc Mix_SetReverseStereo "Mix_SetReverseStereo" int, int ;channel, flip; 逆位相エコー
	; END OF EFFECT API

	#cfunc Mix_ReserveChannels "Mix_ReserveChannels" int ; チャンネルを静的に予約する; num
	#cfunc Mix_GroupChannel "Mix_GroupChannel" int, int ; 脚注参照。 which, tag
	#cfunc Mix_GroupChannels "Mix_GroupChannels" int, int, int; 脚注参照。from, to, tag
	#cfunc Mix_GroupAvailable "Mix_GroupAvailable" int;脚注参照。 tag, もしグループ
	#cfunc Mix_GroupCount "Mix_GroupCount" int;脚注参照。 tag
	#cfunc Mix_GroupOldest "Mix_GroupOldest" int;脚注参照。tag
	#cfunc Mix_GroupNewer "Mix_GroupNewer" int;脚注参照。tag

	#cfunc Mix_PlayChannelTimed "Mix_PlayChannelTimed" int,int,int,int;タイム指定でChunkを再生。channel, Pchunk, 
	#cfunc Mix_FadeInMusic "Mix_FadeInMusic" int,int,int ;フェードイン。Mix_Music, loops, ms
	#cfunc Mix_FadeInMusicPos "Mix_FadeInMusicPos" int, int, int, double;フェードイン+位置指定。Mix_Music, loops, ms, position?
	#cfunc Mix_FadeInChannelTimed "Mix_FadeInChannelTimed" int, int, int, int, int;Chunkをチャンネルにアサインした上でフェードイン再生, channel, Mix_Chunk, loops, ms, ticks

	#cfunc Mix_FadeOutChannel "Mix_FadeOutChannel" int,int; フェードアウト。which, ms
	#cfunc Mix_FadeOutGroup "Mix_FadeOutGroup" int, int; フェードアウト　グループ単位でフェードアウトする。環境音とか？
	#cfunc Mix_FadeOutMusic "Mix_FadeOutMusic" int; フェードアウト。 ms単位
	
	#cfunc Mix_SetSoundFonts "Mix_SetSoundFonts" sptr ; MIDI用サウンドフォント指定 path
	#cfunc Mix_GetSoundFonts "Mix_GetSoundFonts" ;SoundFont取得
	#cfunc Mix_GetChunk "Mix_GetChunk" int; チャンネルから今再生している？Chunkを取得
	
	; 2.0.4ヘッダから(不明?)
	#cfunc Mix_AllocateChannels "Mix_AllocateChannels" int; 多分ミキサー予約するチャンネルを変更できる。
	#cfunc Mix_GetMusicType " Mix_GetMusicType" int ; Mix_Musicにロードされた曲の種類を取得。
	
	;多分ID3タグ系
	#cfunc Mix_GetMusicTitle "Mix_GetMusicTitle" int ; Mix_Music; Return String PTR
	#cfunc Mix_GetMusicTitleTag "Mix_GetMusicTitleTag" int ;; Return SPTR
	#cfunc Mix_GetMusicArtistTag "Mix_GetMusicArtistTag" int ;; Return SPTR
	#cfunc Mix_GetMusicAlbumTag "Mix_GetMusicAlbumTag" int ;; Return SPTR
	#cfunc Mix_GetMusicCopyrightTag "Mix_GetMusicCopyrightTag" int ;; Return SPTR


	#define ctype Mix_LoadWAV(%1) Mix_LoadWAV_RW(SDL_RWFromFile(%1,"rb"),1); Loadの簡単奴。 sptr.
	#define ctype Mix_FadeInChannel(%1,%2,%3,%4) Mix_FadeInChannelTimed(%1,%2,%3,%4,-1); channel, chunk, loops, ms.
	#define ctype Mix_PlayChannel(%1,%2,%3) Mix_PlayChannelTimed(%1,%2,%3,-1) ;channel, chunk, loops
#endif
#uselib "SDL2.dll"
	;SDL2関連で必要なものをフックする
	#cfunc SDL_RWFromFile "SDL_RWFromFile" sptr,sptr ;SDL向けFILE*みたいな。
	;#cfunc SDL_
	#cfunc SDL_GetError "SDL_GetError" ;エラーを取得。

#endif

#define AUDIO_U8        0x0008  /**< Unsigned 8-bit samples */
#define AUDIO_S8        0x8008  /**< Signed 8-bit samples */
#define AUDIO_U16LSB    0x0010  /**< Unsigned 16-bit samples */
#define AUDIO_S16LSB    0x8010  /**< Signed 16-bit samples */
#define AUDIO_U16MSB    0x1010  /**< As above, but big-endian byte order */
#define AUDIO_S16MSB    0x9010  /**< As above, but big-endian byte order */
#define AUDIO_U16       AUDIO_U16LSB
#define AUDIO_S16       AUDIO_S16LSB

;INITFLAG 読み込ませたいDLLを選択。
#define MIX_INIT_FLAC 1
#define MIX_INIT_MOD 2
#define MIX_INIT_MP3 8
#define MIX_INIT_OGG 16
#define MIX_INIT_MID 32
#define MIX_INIT_OPUS 64

/*
YOYO
 
 2007/7/27(Fri) 01:28:25|NO.9784

整数と小数では返り値を渡す仕組みが異なるのでプラグインかマシン語で取り出す仕組みが必要です。
強引ですが、関数の返した小数を取り出すモジュールを作ってみました。
関数が返す少数はdoubleとfloatどちらでも大丈夫です。
*/
#module
	#uselib "kernel32.dll"
	#func VirtualProtect "VirtualProtect" int, int, int, int
#deffunc getdouble
	if code == 0 {
		code=$0424448b,$04c218dd,$00000000
		VirtualProtect varptr(code), length(code)*4, $40, varptr(res)
		fret=0.0
	}
	prm = varptr(fret)
	res = callfunc(prm, varptr(code), 1)
	return fret
#global


/*
	非対応: カスタムPostProcess関連。Function PTRはC側依存にしないとだめ。
	逆を言えばDLLさえ読み込んでPTR渡せばうまくいく？

	MusicとSEはチャンネル自体は独立している。


	

	グループについて。
		確保されたチャンネルはグループ化することができる。
		
	
	
*/
