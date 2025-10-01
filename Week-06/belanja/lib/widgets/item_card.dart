import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Menggunakan Go Router dengan extra data
          context.push('/item', extra: item);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Animation untuk gambar
              Hero(
                tag: 'image_${item.name}',
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(item.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              // Nama produk dengan Hero
              Hero(
                tag: 'name_${item.name}',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Harga
              Text(
                'Rp ${item.price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Rating
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    item.rating.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              
              const SizedBox(height: 4),
              
              // Stok
              Text(
                'Stok: ${item.stock}',
                style: TextStyle(
                  fontSize: 12,
                  color: item.stock > 0 ? Colors.grey[600] : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}