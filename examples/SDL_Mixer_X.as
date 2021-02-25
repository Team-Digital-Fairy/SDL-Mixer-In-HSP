#ifdef __hsp30__
#ifndef __SDLMIXER__
#define global __SDLMIXER__
#uselib "SDL2_mixer_ext.dll"
	; SDL_Mixer_EXT���g�����Ƃɂ����B
	#cfunc Mix_Linked_Version "Mix_Linked_Version"

	;�������֘A
	#cfunc Mix_Init "Mix_Init" int ;�{����SDL�Ƌ��ɏ����������ق��������񂾂��ǁA����Ȃ��E�E�E�H
	#cfunc Mix_Quit "Mix_Quit"
	#cfunc Mix_OpenAudio "Mix_OpenAudio" int,int,int,int ; Mixer���w�肵���I�[�f�B�I�t�H�[�}�b�g�ŊJ��
	;int SDLCALL Mix_OpenAudioDevice(int frequency, Uint16 format, int channels, int chunksize, const char* device, int allowed_changes);
	#cfunc Mix_CloseAudio "Mix_CloseAudio"
	#cfunc Mix_QuerySpec "Mix_QuerySpec" var,var,var ;SpecQuery
	
	;#cfunc Mix_GetError "Mix_GetError" ; String PTR�Ԃ����B����
	;�ȍĐ��֘A
	#cfunc Mix_LoadMUS "Mix_LoadMUS" sptr ;Path�w��Ń��[�h�B
	#cfunc Mix_LoadMUS_RW "Mix_LoadMUS_RW" int,int ; RWops���g����MUS�����[�h�B
	
	#cfunc Mix_FreeMusic "Mix_FreeMusic" int ;���[�h�����~���[�W�b�N���J������B
	#cfunc Mix_PlayMusic "Mix_PlayMusic" int,int ;Music���Đ��B Mix_Music, loops (-1�Ŗ���)
	#cfunc Mix_PlayChannelTimedVolume "Mix_PlayChannelTimedVolume" int,int,int,int,int ;���ʐݒ�+�������~�b�g�t���ōĐ��B ;MIXER-X�I�����[
	#define ctype Mix_PlayChannelVol(%1,%2,%3,%4) Mix_PlayChannelTimedVolume(%1,%2,%3,-1,%4) ;�������~�b�g�Ȃ�+���ʐݒ肠��
	

	#cfunc Mix_PlayingMusic "Mix_PlayingMusic" ;Mix_Music�Đ����Ă�? 1�Ȃ�Yes

	#cfunc global Mix_Playing "Mix_Playing" int

	#cfunc Mix_Pause "Mix_Pause" int; �`�����l�����|�[�Y���� channel
	#cfunc Mix_Resume "Mix_Resume" int; �`�����l�������W���[������Bchannel
	#cfunc Mix_Paused "Mix_Paused" int;�|�[�Y���Ă���H channel

	#cfunc Mix_FadeOutMusicStream "Mix_FadeOutMusicStream" int,int 

	;#cfunc Mix_PauseMusic "Mix_PauseMusic" ;�Ȃ��|�[�Y����B
	;#cfunc Mix_ResumeMusic "Mix_ResumeMusic" ;�Ȃ��ĊJ����B
	;#cfunc Mix_RewindMusic "Mix_RewindMusic" ;�Ȃ������߂�����B
	;#cfunc Mix_PausedMusic "Mix_PausedMusic" ;���|�[�Y���Ă���H
	#cfunc Mix_PauseMusicStream "Mix_PauseMusicStream" int ;�Ȃ��|�[�Y����B Mix_Music
	#cfunc Mix_ResumeMusicStream "Mix_ResumeMusicStream" int ;�Ȃ��ĊJ����B Mix_Music
	#cfunc Mix_RewindMusicStream "Mix_RewindMusicStream" int ;�Ȃ������߂�����B Mix_Music
	#cfunc Mix_PausedMusicStream "Mix_PausedMusicStream" int ;���|�[�Y���Ă���H Mix_Music

	#cfunc Mix_SetMusicStreamPosition "Mix_SetMusicStreamPosition" int,double ;����Mix_Music�̍Đ��ʒu���w�� Mix_Music, position
	;#cfunc Mix_SetMusicPosition "Mix_SetMusicPosition" double;�Ȃ̈ʒu�w��B position ;�G���[�Ȃ�-1���Ԃ��Ă���B
	#cfunc Mix_GetMusicPosition "Mix_GetMusicPosition" int; �Ȃ̒������擾�B Mix_Music ;double��pos���Ԃ��Ă���B

	#cfunc Mix_GetMusicTotalTime "Mix_GetMusicTotalTime" int ;�Ȃ̒������擾
	#cfunc Mix_GetMusicLoopStartTime "Mix_GetMusicLoopStartTime" int ;���[�v�|�C���g���n�܂���擾 Mix_Music
	#cfunc Mix_GetMusicLoopEndTime "Mix_GetMusicLoopEndTime" int;���[�v�|�C���g�̏I�����擾 Mix_Music
	#cfunc Mix_GetMusicLoopLengthTime "Mix_GetMusicLoopLengthTime" int ;Loop�������擾 Mix_Music

	#cfunc Mix_SetMusicTempo "Mix_SetMusicTempo" int, double;�e���|�̊�����ݒ� Mix_Music, position
	#cfunc Mix_GetMusicTempo "Mix_GetMusicTempo" int ;�e���|�̊������擾 Mix_Music 
	
	; Volume��0-128�͈̔́B
	#cfunc Mix_Volume "Mix_Volume" int, int ;�`�����l���P�ʂ̃{�����[���w�� channel, volume.
	#cfunc Mix_VolumeChunk "Mix_VolumeChunk" int,int ;�`�����N�w��̃{�����[���ݒ� chunk, volume
	#cfunc Mix_VolumeMusic "Mix_VolumeMusic" int ;���Đ����Ă�{�����[����ς���B�@�E�E�E����킩���B
	#cfunc Mix_GetVolumeMusicStream "Mix_GetVolumeMusicStream" int;���Đ����Ă�MixMusic�̃{�����[�����擾 Mix_Music

	#cfunc Mix_HaltChannel "Mix_HaltChannel" int ;channel �`�����l���P�ʂŎ~�߂�B
	#cfunc Mix_HaltGroup "Mix_HaltGroup" int ;�O���[�v�P�ʂŎ~�߂�
	#cfunc Mix_HaltMusic "Mix_HaltMusic"; ���ׂĂ�Music��~�B
	#cfunc Mix_ExpireChannel "Mix_ExpireChannel" int,int;���b��ɒ�~�Bchannel,ticks
	;�T���v���֘A Mix_Chunk�������n��
	#cfunc Mix_GetNumChunkDecoders "Mix_GetChunkDecoders" ;int�Ԃ�
	#cfunc Mix_GetChunkDecoder "Mix_GetChunkDecoder" int ;String PTR
	#cfunc Mix_LoadWAV_RW "Mix_LoadWAV_RW" int,int ; Chunk����
	;#cfunc Mix_LoadWAV "Mix_LoadWAV" sptr ;�t�@�C���l�[��
	#cfunc Mix_QuickLoad_WAV "Mix_QuickLoad_WAV" int ;�������łɃ������Ƀ��[�h�����ꍇ�BPTR���󂯎��
	#cfunc Mix_FreeChunk "Mix_FreeChunk" int ; MixChunk PTR�B�Đ�����FREE����Ǝ��̂��B
	
	; �t�B���^�֘A�B
	#cfunc Mix_SetPanning "Mix_SetPanning" int,int,int ;channel, left, right �p����channel�ɐݒ�
	#cfunc Mix_SetPosition "Mix_SetPosition" int, int, int ;channel, angle, distance �p�x�Ƌ����w��ł̐[�x����
	#cfunc Mix_SetDistance "Mix_SetDistance" int, int ;channel, distance�@�����w��ł̐[�x����
	;#cfunc Mix_SetReverb "Mix_SetReverb" int, int ; channel, echo ���o�[�u���w��
	#cfunc Mix_SetReverseStereo "Mix_SetReverseStereo" int, int ;channel, flip; �t�ʑ��G�R�[
	; END OF EFFECT API

	#cfunc Mix_ReserveChannels "Mix_ReserveChannels" int ; �`�����l����ÓI�ɗ\�񂷂�; num
	#cfunc Mix_GroupChannel "Mix_GroupChannel" int, int ; �r���Q�ƁB which, tag
	#cfunc Mix_GroupChannels "Mix_GroupChannels" int, int, int; �r���Q�ƁBfrom, to, tag
	#cfunc Mix_GroupAvailable "Mix_GroupAvailable" int;�r���Q�ƁB tag, �����O���[�v
	#cfunc Mix_GroupCount "Mix_GroupCount" int;�r���Q�ƁB tag
	#cfunc Mix_GroupOldest "Mix_GroupOldest" int;�r���Q�ƁBtag
	#cfunc Mix_GroupNewer "Mix_GroupNewer" int;�r���Q�ƁBtag

	#cfunc Mix_PlayChannelTimed "Mix_PlayChannelTimed" int,int,int,int;�^�C���w���Chunk���Đ��Bchannel, Pchunk, 
	#cfunc Mix_FadeInMusic "Mix_FadeInMusic" int,int,int ;�t�F�[�h�C���BMix_Music, loops, ms
	#cfunc Mix_FadeInMusicPos "Mix_FadeInMusicPos" int, int, int, double;�t�F�[�h�C��+�ʒu�w��BMix_Music, loops, ms, position?
	#cfunc Mix_FadeInChannelTimed "Mix_FadeInChannelTimed" int, int, int, int, int;Chunk���`�����l���ɃA�T�C��������Ńt�F�[�h�C���Đ�, channel, Mix_Chunk, loops, ms, ticks

	#cfunc Mix_FadeOutChannel "Mix_FadeOutChannel" int,int; �t�F�[�h�A�E�g�Bwhich, ms
	#cfunc Mix_FadeOutGroup "Mix_FadeOutGroup" int, int; �t�F�[�h�A�E�g�@�O���[�v�P�ʂŃt�F�[�h�A�E�g����B�����Ƃ��H
	#cfunc Mix_FadeOutMusic "Mix_FadeOutMusic" int; �t�F�[�h�A�E�g�B ms�P��
	
	#cfunc Mix_SetSoundFonts "Mix_SetSoundFonts" sptr ; MIDI�p�T�E���h�t�H���g�w�� path
	#cfunc Mix_GetSoundFonts "Mix_GetSoundFonts" ;SoundFont�擾
	#cfunc Mix_GetChunk "Mix_GetChunk" int; �`�����l�����獡�Đ����Ă���HChunk���擾
	
	; 2.0.4�w�b�_����(�s��?)
	#cfunc Mix_AllocateChannels "Mix_AllocateChannels" int; �����~�L�T�[�\�񂷂�`�����l����ύX�ł���B
	#cfunc Mix_GetMusicType " Mix_GetMusicType" int ; Mix_Music�Ƀ��[�h���ꂽ�Ȃ̎�ނ��擾�B
	
	;����ID3�^�O�n
	#cfunc Mix_GetMusicTitle "Mix_GetMusicTitle" int ; Mix_Music; Return String PTR
	#cfunc Mix_GetMusicTitleTag "Mix_GetMusicTitleTag" int ;; Return SPTR
	#cfunc Mix_GetMusicArtistTag "Mix_GetMusicArtistTag" int ;; Return SPTR
	#cfunc Mix_GetMusicAlbumTag "Mix_GetMusicAlbumTag" int ;; Return SPTR
	#cfunc Mix_GetMusicCopyrightTag "Mix_GetMusicCopyrightTag" int ;; Return SPTR


	#define ctype Mix_LoadWAV(%1) Mix_LoadWAV_RW(SDL_RWFromFile(%1,"rb"),1); Load�̊ȒP�z�B sptr.
	#define ctype Mix_FadeInChannel(%1,%2,%3,%4) Mix_FadeInChannelTimed(%1,%2,%3,%4,-1); channel, chunk, loops, ms.
	#define ctype Mix_PlayChannel(%1,%2,%3) Mix_PlayChannelTimed(%1,%2,%3,-1) ;channel, chunk, loops
#endif
#uselib "SDL2.dll"
	;SDL2�֘A�ŕK�v�Ȃ��̂��t�b�N����
	#cfunc SDL_RWFromFile "SDL_RWFromFile" sptr,sptr ;SDL����FILE*�݂����ȁB
	;#cfunc SDL_
	#cfunc SDL_GetError "SDL_GetError" ;�G���[���擾�B

#endif

#define AUDIO_U8        0x0008  /**< Unsigned 8-bit samples */
#define AUDIO_S8        0x8008  /**< Signed 8-bit samples */
#define AUDIO_U16LSB    0x0010  /**< Unsigned 16-bit samples */
#define AUDIO_S16LSB    0x8010  /**< Signed 16-bit samples */
#define AUDIO_U16MSB    0x1010  /**< As above, but big-endian byte order */
#define AUDIO_S16MSB    0x9010  /**< As above, but big-endian byte order */
#define AUDIO_U16       AUDIO_U16LSB
#define AUDIO_S16       AUDIO_S16LSB

;INITFLAG �ǂݍ��܂�����DLL��I���B
#define MIX_INIT_FLAC 1
#define MIX_INIT_MOD 2
#define MIX_INIT_MP3 8
#define MIX_INIT_OGG 16
#define MIX_INIT_MID 32
#define MIX_INIT_OPUS 64

/*
YOYO
 
 2007/7/27(Fri) 01:28:25|NO.9784

�����Ə����ł͕Ԃ�l��n���d�g�݂��قȂ�̂Ńv���O�C�����}�V����Ŏ��o���d�g�݂��K�v�ł��B
�����ł����A�֐��̕Ԃ������������o�����W���[��������Ă݂܂����B
�֐����Ԃ�������double��float�ǂ���ł����v�ł��B
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
	��Ή�: �J�X�^��PostProcess�֘A�BFunction PTR��C���ˑ��ɂ��Ȃ��Ƃ��߁B
	�t��������DLL�����ǂݍ����PTR�n���΂��܂������H

	Music��SE�̓`�����l�����͓̂Ɨ����Ă���B


	

	�O���[�v�ɂ��āB
		�m�ۂ��ꂽ�`�����l���̓O���[�v�����邱�Ƃ��ł���B
		
	
	
*/
