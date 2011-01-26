# New ports collection makefile for:	ipw-firmware
# Date created:				May 11 2005
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/net/ipw-firmware/Makefile,v 1.20 2006/09/17 01:11:23 kris Exp $
# $MidnightBSD: mports/net/ipw-firmware/Makefile,v 1.3 2007/08/01 20:46:41 laffer1 Exp $

PORTNAME?=	ipw-firmware
RELNAME?=	ipw2100
PORTVERSION?=	1.3
PORTREVISION?=	9
CATEGORIES=	net sysutils
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	flz/ipw
DISTFILES=	${RELNAME}-fw-${PORTVERSION}.tgz

MAINTAINER=	ports@midnightbsd.org
COMMENT?=	Intel PRO/Wireless 2100 Driver Firmware

DRIVERNAME?=	ipw
DRIVERVERSION?=	1.6.4
DRIVERDISTNAME=	${DRIVERNAME}-freebsd-${DRIVERVERSION}
DISTFILES+=	${DRIVERDISTNAME}.tgz
FIRMWARES?=	${RELNAME}-${PORTVERSION}-i.fw:${DRIVERNAME}-i.fw \
		${RELNAME}-${PORTVERSION}-p.fw:${DRIVERNAME}-p.fw \
		${RELNAME}-${PORTVERSION}.fw:${DRIVERNAME}.fw

# Override PREFIX to install ${DRIVERNAME}control(8) somewhere we hope it'll
# be available soon enough.
PREFIX=		/usr

.include <bsd.port.pre.mk>
 
# Dummy OSVERSION for ipw.
MIN7OSVERSION?=	999999

# Try to guess sensible defaults.
.if ${OSVERSION} > ${MIN7OSVERSION}
OPTIONS+=	CONTROL	"Install ${DRIVERNAME}control(8) utility" off
.else
OPTIONS+=	CONTROL	"Install ${DRIVERNAME}control(8) utility" on
.endif

OPTIONS+=	MODULE	"Install ${DRIVERNAME}(4) kernel module (very old snapshot)" off


WRKSRC=		${WRKDIR}
KERNDIR=	/boot/kernel
KMODDIR=	/boot/modules
FWDIR=		/boot/firmware
SUB_FILES=	pkg-message
SUB_LIST=	DRIVERNAME="${DRIVERNAME}" \
		RELNAME="${RELNAME}" \
		KMODDIR="${KMODDIR}" \
		FWDIR="${FWDIR}"
PLIST_SUB:=	${SUB_LIST}
MAKE_ENV=	BINDIR="${PREFIX}/sbin" \
		MANDIR="${PREFIX}/share/man/man" \
		KMODDIR="${KMODDIR}"
FAKE_SETUP+=	FWDIR=${FAKE_DESTDIR}${FWDIR}

MANCOMPRESSED=	yes
IS_INTERACTIVE=	yes


.if ${OSVERSION} > ${MIN7OSVERSION}
SUB_LIST+=	DONT_NEED_CONTROL="@comment "
MTREE_DIRRM=	"@comment "
. if !defined(WITHOUT_CONTROL)
IGNORE=		is configured with ${DRIVERNAME}control(8) which you don't need, use 'make rmconfig' and uncheck CONTROL
. endif
.else
SUB_LIST+=	DONT_NEED_CONTROL=""
MTREE_DIRRM=	""
MAN8+=		${DRIVERNAME}control.8
USE_RCORDER=	${DRIVERNAME}.sh
.endif

PLIST_SUB+=	MTREE_DIRRM=${MTREE_DIRRM}

.if defined(WITH_MODULE)
IGNORE=		is configured with ${DRIVERNAME}(4) support which you don't need, use 'make rmconfig' and uncheck MODULE
.else
PLIST_SUB+=	WITH_MODULE="@comment MODULE "
.endif

.if !defined(WITHOUT_CONTROL)
PLIST_SUB+=	WITH_CONTROL=""
.else
PLIST_SUB+=	WITH_CONTROL="@comment CONTROL "
.endif

# "Might" because people still can include ${DRIVERNAME}(4) support in kernel by extracting
# its source in src/ and tweaking src/sys/conf/files.
SUB_LIST+=	MIGHT_NEED_MODULE="@comment "

do-build:
.if defined(WITH_MODULE)
. for i in share sys
	cd ${WRKSRC}/${DRIVERDISTNAME}/src/${i}; make all
. endfor
.endif
.if !defined(WITHOUT_CONTROL)
	cd ${WRKSRC}/${DRIVERDISTNAME}/src/usr.sbin/${DRIVERNAME}control/; make all
.endif

do-install:
.if defined(WITH_MODULE)
. for i in share sys
	cd ${WRKSRC}/${DRIVERDISTNAME}/src/${i}; make install ${FAKE_MAKEARGS} ${MAKE_ENV}
. endfor
.endif
.if !defined(WITHOUT_CONTROL)
	cd ${WRKSRC}/${DRIVERDISTNAME}/src/usr.sbin/${DRIVERNAME}control/; make install ${FAKE_MAKEARGS} ${MAKE_ENV}
.endif
	${MKDIR} ${FWDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENSE ${FWDIR}/LICENSE.${DRIVERNAME}
.for i in ${FIRMWARES}
	${INSTALL_DATA} ${WRKSRC}/${i:C/:.*//} ${FWDIR}/${i:C/.*://}
.endfor

post-install:
.if defined(WITH_MODULE)
	@${ECHO_CMD} "You asked for ${DRIVERNAME}(4) module to be installed but"
	@${ECHO_CMD} "be aware that this is a *very* *old* snapshot of the code"
	@${ECHO_CMD} "and that it probably won't work correctly."
	@${ECHO_CMD} "This option will probably go away in a near future."
	@${ECHO_CMD} "SLIPPERY WHEN WET ! BEWARE OF THE DOGS !"
	@${ECHO_CMD} "You have been warned."
.endif


.include <bsd.port.post.mk>
