# $MidnightBSD$
# $FreeBSD: head/emulators/hyperv-is/Makefile 370396 2014-10-07 20:27:29Z marino $

PORTNAME=	hyperv-is
PORTVERSION=	1.1
PORTREVISION=	0
CATEGORIES=	emulators
MASTER_SITES=	https://github.com/${MSLINK}/
DISTNAME=	${DNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD Integration Service on Hyper-v

LICENSE=	unknown

USES=		kmod uidfix
BIS=		${PORTVERSION}
MSBASE=		FreeBSDonHyper-V/Hyperv-Ports/raw/hyperv-is-master
MSLINK=		${MSBASE}/BIS-${BIS}/FreeBSD-9.1/ports
MAKE_ARGS=	BINDIR=${PREFIX}/sbin MANDIR=${PREFIX}/man/man
PKGMESSAGE=	${FILESDIR}/${PMSG}

FAKE_OPTS=	trueprefix

.include <bsd.port.pre.mk>

CC=		gcc -w
WRKSRC=		${WRKDIR}/hyperv-is-${PORTVERSION}
PLIST_SUB=	B="@comment " A=""
PMSG=		pkg-message.A

FILE_91=	hyperv-is-9.1.${BIS}
DNAME=		${FILE_91}

post-patch:
	@${REINPLACE_CMD} -e "s,/usr/sbin/,${TRUE_PREFIX}/sbin/,g" \
		${WRKSRC}/etc/rc.d/hv_kvpd

pre-install:
	@${MKDIR} ${PREFIX} \
		${FAKE_DESTDIR}/etc/rc.d \
		${FAKE_DESTDIR}/usr/local/hyperv/scripts \
		${FAKE_DESTDIR}/boot/kernel

post-install:
	${MV} ${FAKE_DESTDIR}/etc/rc.d/* ${PREFIX}/etc/rc.d

.include <bsd.port.post.mk>
