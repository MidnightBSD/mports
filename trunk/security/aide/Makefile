# $MidnightBSD: mports/security/aide/Makefile,v 1.7 2010/12/07 00:52:21 laffer1 Exp $

PORTNAME=	aide
PORTVERSION=	0.13.1
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	SF \
		http://www.cs.tut.fi/~rammer/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A replacement and extension for Tripwire
LICENSE=	gpl2

LIB_DEPENDS=	mhash.2:${PORTSDIR}/security/mhash

USE_GMAKE=	yes
USE_BISON=	build
USE_AUTOTOOLS=	autoconf
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-mhash \
		--with-zlib \
		--with-config_file=${PREFIX}/etc/aide.conf

CONFIGURE_ENV+=	CFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

MAN1=		aide.1
MAN5=		aide.conf.5

SUB_FILES=	pkg-message

post-install:
	${INSTALL_DATA} ${FILESDIR}/aide.conf.freebsd ${FAKE_DESTDIR}${TRUE_PREFIX}/etc/aide.conf.sample
.if defined(AIDE_FLOPPY)
	@disklabel -w -B /dev/rfd0c fd1440
	@newfs -u 0 -t 0 -i 196608 -m 0 -T minimum -o space /dev/rfd0c
	@mount /dev/fd0c /mnt
	@${CP} ${PREFIX}/bin/aide /mnt/aide
	@${CP} -p /var/db/aide/aide.conf /mnt/aide.conf
	@${CP} < /var/db/aide/databases/aide.db /mnt/aide.db
	@${CHMOD} 555 /mnt/aide
	@umount /mnt
	@${ECHO} Do not forget to remove and write-protect the floppy.
.endif

.include <bsd.port.mk>
