# $MidnightBSD$

PORTNAME=	dkftpbench
PORTVERSION=	0.45
PORTREVISION=	4
CATEGORIES=	benchmarks ftp
MASTER_SITES=	http://www.kegel.com/dkftpbench/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FTP benchmark program

LICENSE=	gpl2

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} \
		-e '/^noinst_PROGRAMS =/s/=.*/=/' \
		-e '/^lib_LIBRARIES =/s/=.*/=/' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
