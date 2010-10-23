# $MidnightBSD$

PORTNAME=		Parse-Pidl
PORTVERSION?=		0.02
PORTREVISION=		0
PORTEPOCH=		0
CATEGORIES=		devel perl5
PKGNAMEPREFIX=		p5-
PKGNAMESUFFIX=

COMMENT=		IDL compiler written in Perl
LICENSE=		perl

RUN_DEPENDS=		${SITE_PERL}/Parse/Yapp.pm:${PORTSDIR}/devel/p5-Parse-Yapp

CONFLICTS=

SAMBA_PORT?=		samba4-devel
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../../net/${SAMBA_PORT}
PKGDIR=			${.CURDIR}

PERL_CONFIGURE=		yes
WRKSRC=			${WRKDIR}/${DISTNAME}/pidl

MAN1=			pidl.1
MAN3=			Parse::Pidl::Dump.3 Parse::Pidl::Util.3 \
			Parse::Pidl::Wireshark::Conformance.3 \
			Parse::Pidl::Wireshark::NDR.3 Parse::Pidl::NDR.3

post-extract:
		@${RM} -rf ${WRKSRC}/lib/Parse/Yapp

.include "${MASTERDIR}/Makefile"
