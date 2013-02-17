# $MidnightBSD: mports/devel/p5-Cache-Cache/Makefile,v 1.1 2007/09/12 02:45:26 ctriv Exp $

PORTNAME=	Cache-Cache
PORTVERSION=	1.06
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Cache
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Cache::Cache -- Perl Cache interface
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/IPC/ShareLite.pm:${PORTSDIR}/devel/p5-IPC-ShareLite \
		${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/${PERL_ARCH}/Digest/MD5.pm:${PORTSDIR}/security/p5-Digest-MD5 \
		${SITE_PERL}/${PERL_ARCH}/Storable.pm:${PORTSDIR}/devel/p5-Storable \
		${SITE_PERL}/Error.pm:${PORTSDIR}/lang/p5-Error \
		${SITE_PERL}/${PERL_ARCH}/Digest/SHA1.pm:${PORTSDIR}/security/p5-Digest-SHA1
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Cache::BaseCache.3 \
	Cache::BaseCacheTester.3 \
	Cache::Cache.3 \
	Cache::CacheMetaData.3 \
	Cache::CacheSizer.3 \
	Cache::CacheTester.3 \
	Cache::CacheUtils.3 \
	Cache::FileBackend.3 \
	Cache::FileCache.3 \
	Cache::MemoryBackend.3 \
	Cache::MemoryCache.3 \
	Cache::NullCache.3 \
	Cache::Object.3 \
	Cache::SharedMemoryBackend.3 \
	Cache::SharedMemoryCache.3 \
	Cache::SizeAwareCache.3 \
	Cache::SizeAwareCacheTester.3 \
	Cache::SizeAwareFileCache.3 \
	Cache::SizeAwareMemoryCache.3 \
	Cache::SizeAwareSharedMemoryCache.3

.include <bsd.port.mk>
