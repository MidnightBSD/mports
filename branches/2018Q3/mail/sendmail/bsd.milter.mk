# makefile for use of:	sendmail milter lib
# Date created:		08 Nov 2006
# Whom:			dinoex
#
# $FreeBSD: ports/mail/sendmail/bsd.milter.mk,v 1.2 2007/02/02 20:17:17 dinoex Exp $
# $MidnightBSD: mports/mail/sendmail/bsd.milter.mk,v 1.2 2007/11/06 04:26:20 laffer1 Exp $
#
# a port shall includes this file after bsd.ports.pre.mk
# .include "${PORTSDIR}/${PKGCATEGORY}/sendmail/bsd.milter.mk"
#
# the user/port can now set this options in the makefiles.
#
# WITH_SENDMAIL_STATIC_MILTER=	- Use static milter lib
#
# WITH_SENDMAIL_BASE=yes	- Use milter in the base
# WITH_SENDMAIL_PORT=yes	- Use milter from ports
#
# If unspecified, check for the lib exits in the base system,
# but give an installed port preference over it.
#
#
# Overrideable defaults:
#
# SENDMAIL_MILTER_PORT?=	sendmail
#
# The makefile sets this variables:
# MILTERBASE		- "/usr" or ${LOCALBASE}
# MILTERINC		- path to the matching includes
# MILTERLIB		- path to the libs
# MILTERRPATH		- rpath for dynamic linker
# 
# The makefile extend this variables:
# LIB_DEPENDS
# BUILD_DEPENDS
# CFLAGS
# LDFLAGS
#
# MAKE_ENV		- extended with the variables above
# CONFIGURE_ENV		- extended with LDFLAGS
# BUILD_DEPENDS		- are added if needed
# RUN_DEPENDS		- are added if needed

Milter_Include_MAINTAINER=	ports@MidnightBSD.org

.if	!defined(WITH_SENDMAIL_BASE) && \
	!defined(WITH_SENDMAIL_PORT)
.if	exists(${LOCALBASE}/lib/libmilter.a) || \
	!exists(/usr/lib/libmilter.a)
WITH_SENDMAIL_PORT=yes
.else
WITH_SENDMAIL_BASE=yes
.endif
.endif

.if defined(WITH_SENDMAIL_PORT)

.if defined(WITH_SENDMAIL_STATIC_MILTER)
BUILD_DEPENDS+=	${LOCALBASE}/lib/libmilter.a:${PORTSDIR}/mail/${SENDMAIL_MILTER_PORT}
.else
BUILD_DEPENDS+=	${LOCALBASE}/lib/libmilter.so.${MILTER_SOVER}:${PORTSDIR}/mail/${SENDMAIL_MILTER_PORT}
RUN_DEPENDS+=	${LOCALBASE}/lib/libmilter.so.${MILTER_SOVER}:${PORTSDIR}/mail/${SENDMAIL_MILTER_PORT}
.endif

SENDMAIL_MILTER_PORT?=	sendmail
MILTER_SOVER?=	6
MILTERBASE?=	${LOCALBASE}
MILTERINC=	-I${MILTERBASE}/include
MILTERRPATH=	${MILTERBASE}/lib
MILTERLIB=	-L${MILTERBASE}/lib -Wl,-rpath,${MILTERRPATH}

.if !defined(WITHOUT_MILTER_CFLAGS)
.if defined(CFLAGS)
CFLAGS+=${MILTERINC}
.else
CFLAGS=${MILTERINC}
.endif
.endif

.if defined(WITHOUT_MILTER)
pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} You must unset variable SENDMAIL_WITHOUT_MILTER,
	@${ECHO_MSG} and rebuild sendmail in the ports
	@${FALSE}
.endif

.endif

.if defined(WITH_SENDMAIL_BASE)
MILTERBASE?=	/usr
MILTERRPATH=	${DESTDIR}/usr/lib:${LOCALBASE}/lib
MILTERLIB=	-Wl,-rpath,${MILTERRPATH}
.endif

.if !defined(WITHOUT_MILTER_LDFLAGS)
LDFLAGS+=${MILTERLIB}
.endif

# eof
