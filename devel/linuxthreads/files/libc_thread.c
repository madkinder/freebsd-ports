/*
 * Copyright (c) 1999 Richard Seaman, Jr.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by Richard Seaman, Jr.
 * 4. Neither the name of the author nor the names of any co-contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY RICHARD SEAMAN, Jr. AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */

#ifndef _THREAD_SAFE
#define _THREAD_SAFE
#endif

#include "pthread.h"
/* Our internal pthreads definitions are here. Set as needed */
#if defined(COMPILING_UTHREADS)
#include "pthread_private.h"
#endif
#if defined(LINUXTHREADS)
#include "internals.h"
#else
/* Your internal definition here */
#endif

/* These are from lib/libc/include */
#include "libc_private.h"
#if !defined(LINUXTHREADS)
#include "spinlock.h"
#endif

/* This is defined in lib/libc/stdlib/exit.c.  It turns on thread safe
 * behavior in libc if non-zero.
 */
extern int __isthreaded;

/* Optional.  In case our code is dependant on the existence of
 * the posix priority extentions kernel option.
 */
#if defined(LINUXTHREADS)
#include <sys/sysctl.h>
int _posix_priority_scheduling;
#endif

#if defined(NEWLIBC)
/* The following are needed if we're going to get thread safe behavior
 * in the time functions in lib/libc/stdtime/localtime.c
 */
#if defined(COMPILING_UTHREADS)
static struct pthread_mutex	_lcl_mutexd = PTHREAD_MUTEX_STATIC_INITIALIZER;
static struct pthread_mutex	_gmt_mutexd = PTHREAD_MUTEX_STATIC_INITIALIZER;
static struct pthread_mutex	_localtime_mutexd = PTHREAD_MUTEX_STATIC_INITIALIZER;
static struct pthread_mutex	_gmtime_mutexd = PTHREAD_MUTEX_STATIC_INITIALIZER;
static pthread_mutex_t		_lcl_mutex   = &_lcl_mutexd;
static pthread_mutex_t		_gmt_mutex   = &_gmt_mutexd;
static pthread_mutex_t		_localtime_mutex = &_localtime_mutexd;
static pthread_mutex_t		_gmtime_mutex = &_gmtime_mutexd;
#endif
#if defined(LINUXTHREADS)
static pthread_mutex_t	_lcl_mutex	= PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t	_gmt_mutex	= PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t	_localtime_mutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t	_gmtime_mutex	= PTHREAD_MUTEX_INITIALIZER;
#else
/* Customize this based on your mutex declarations */
static pthread_mutex_t	_lcl_mutex	= PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t	_gmt_mutex	= PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t	_localtime_mutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t	_gmtime_mutex	= PTHREAD_MUTEX_INITIALIZER;
#endif
extern pthread_mutex_t	*lcl_mutex;
extern pthread_mutex_t	*gmt_mutex;
extern pthread_mutex_t	*localtime_mutex;
extern pthread_mutex_t	*gmtime_mutex;
#endif

/* Use the constructor attribute so this gets run before main does */
static void _pthread_initialize(void) __attribute__((constructor));

static void _pthread_initialize(void)
{
#if defined(LINUXTHREADS)
	int mib[2];
	size_t len;

	len = sizeof (_posix_priority_scheduling);
	mib[0] = CTL_P1003_1B;
	mib[1] = CTL_P1003_1B_PRIORITY_SCHEDULING;
	if (-1 == sysctl (mib, 2, &_posix_priority_scheduling, &len, NULL, 0))
		_posix_priority_scheduling = 0;
#endif

	/* This turns on thread safe behaviour in libc when we link with it */
	__isthreaded = 1;

#if defined(NEWLIBC)
	/* Set up pointers for lib/libc/stdtime/localtime.c */
	lcl_mutex       = &_lcl_mutex;
	gmt_mutex       = &_gmt_mutex;
	localtime_mutex = &_localtime_mutex;
	gmtime_mutex    = &_gmtime_mutex;
#endif
}

